require 'ostruct'
require 'pry'
require 'binding_of_caller'
require 'pry-byebug'
require 'standalone_migrations'
require 'sqlite3'
require 'nrb/version'

module Nrb
  class Configuration < OpenStruct
    def initialize(*args)
      super
      self.resources = %w(models services)
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

      !!(File.read(gemfile) =~ /gem\s+['"]nrb['"]/)
    end
  end
end

require 'nrb/cli'
