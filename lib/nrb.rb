require 'pry'
require 'binding_of_caller'
require 'pry-byebug'
require 'standalone_migrations'
require 'sqlite3'

require 'nrb/version'
require 'nrb/cli'
require 'ostruct'

module Nrb
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

Nrb.configure do |config|
  config.directories = %w(models services)
end
