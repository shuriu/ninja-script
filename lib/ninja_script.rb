require 'pry'
require 'binding_of_caller'
require 'pry-byebug'
require 'standalone_migrations'
require 'sqlite3'

require 'ninja_script/version'
require 'ninja_script/cli'
require 'ostruct'

module NinjaScript
  class Configuration < OpenStruct; end

  class << self
    def config
      @config ||= Configuration.new
      yield @config if block_given?
      @config
    end
    alias_method :configure, :config

    def root
      config.root
    end
  end
end

NinjaScript.configure do |config|
  config.directories = %w(models services)
end
