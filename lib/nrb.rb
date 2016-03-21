begin
  require 'pry'
  require 'pry-byebug'
rescue LoadError => e
  puts e
end

require 'thor'
require 'active_support/core_ext/string'
require 'active_support/concern'
require 'ostruct'
require 'pathname'

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
      self.autoload_paths = Nrb::RESOURCES
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
