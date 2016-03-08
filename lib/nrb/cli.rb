require 'pry'
require 'binding_of_caller'
require 'thor'
require 'nrb/commands/script'
require 'nrb/commands/starter'
require 'nrb/commands/console'
require 'nrb/commands/generate'
require 'nrb/commands/destroy'

module Nrb
  class CLI < Thor
    register Nrb::Commands::Script, 'new', 'new <name-or-path> [OPTIONS]',
      'Creates a Ninja Ruby Script at the given path'
    tasks['new'].options = Nrb::Commands::Script.class_options

    register Nrb::Commands::Starter, 'start', '[s]tart',
      'Require the main file when inside a NinjaRuby folder'
    map 's' => :start

    register Nrb::Commands::Console, 'console', '[c]onsole',
      'Jump into a Pry console when inside a NinjaRuby folder'
    map 'c' => :console

    register Nrb::Commands::Generate, 'generate', '[g]enerate <resource> <name>',
      "Generate a resource (#{Nrb.config.directories.join(', ')})"
    map 'g' => :generate

    register Nrb::Commands::Destroy, 'destroy', '[d]estroy <resource> <name>',
      "Destroy a resource (#{Nrb.config.directories.join(', ')})"
    map 'd' => :destroy
  end
end
