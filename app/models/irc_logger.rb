require 'eventmachine'
require 'fileutils'
require 'isaac/bot'

class IrcLogger

  attr_reader :config
  
  def initialize config
    @config = {:server => 'irc.freenode.net', :port => 6667}.merge(config)
  end
  
  def run
    context = self
    
    bot = Isaac::Bot.new do
      configure do |c|
        c.nick    = context.config[:nick   ]
        c.server  = context.config[:server ]
        c.port    = context.config[:port   ]
        c.verbose = context.config[:verbose] ? true : false
      end

      on :connect do
        context.config[:channels].each do |channel|
          Message.create :who => context.config[:nick], :what => "/join", :when => Time.now, :where => channel
          join channel
        end
      end

      on :channel do
        Message.create :who => nick, :what => message, :when => Time.now, :where => channel
      end
    end
    EventMachine.run { bot.start }
  end

  def finalize
    config[:channels].each do |channel|
      Message.create :who => config[:nick], :what => "/quit", :when => Time.now, :where => channel
    end
  end
  
end