require File.expand_path('../boot', __FILE__)
require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Irclog
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
