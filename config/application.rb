require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module Railsondocker
  class Application < Rails::Application
    config.load_defaults(Rails.version.split('.')[0...2].join('.'))
  end
end
