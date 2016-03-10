require 'pry'
require 'binding_of_caller'
require 'thor'
require 'nrb/commands/all'

module Nrb
  class CLI < Thor
    class_option :verbose, type: :boolean, default: true,
      desc:    'Verbose mode.',
      aliases: '-v'

    register Nrb::Commands::Script, 'new', 'new <name-or-path> [OPTIONS]',
      Nrb::Commands::Script.desc
    tasks['new'].options = Nrb::Commands::Script.class_options

    register Nrb::Commands::Starter, 'start', '[s]tart',
      Nrb::Commands::Starter.desc
    map 's' => :start

    register Nrb::Commands::Console, 'console', '[c]onsole',
      Nrb::Commands::Console.desc
    map 'c' => :console

    register Nrb::Commands::Generate, 'generate', '[g]enerate <resource> <name>',
      Nrb::Commands::Generate.desc
    map 'g' => :generate

    register Nrb::Commands::Destroy, 'destroy', '[d]estroy <resource> <name>',
      Nrb::Commands::Destroy.desc
    map 'd' => :destroy
  end
end
