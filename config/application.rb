require File.expand_path('../boot', __FILE__)
require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Irclog
  class Application < Rails::Application
    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    config.encoding = "utf-8"
    config.filter_parameters += [ :password ]
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
