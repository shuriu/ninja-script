require 'ostruct'
require 'pry'
require 'binding_of_caller'
require 'pry-byebug'
require 'standalone_migrations'
require 'sqlite3'
require 'nrb/errors'
require 'nrb/version'
require 'nrb/utils'

# The main namespace for this gem's logic.
module Nrb
  RESOURCES = %w(models services).freeze

  # Class that provides a configuration object to the main namespace.
  class Configuration < OpenStruct
    def initialize(*args)
      super
      self.autoload = Nrb::RESOURCES
    end
  end

  class << self
    def config
      @config ||= Configuration.new
      yield @config if block_given?
      @config
    end
    alias_method :configure, :config

    def root
      config.root || Dir.pwd
    end

    def inside?
      gemfile = File.join(Dir.pwd, 'Gemfile')
      return false unless File.exist? gemfile

      !(File.read(gemfile) =~ /gem\s+['"]nrb['"]/).nil?
    end

    def resources
      RESOURCES
    end
  end
end

require 'nrb/cli'
