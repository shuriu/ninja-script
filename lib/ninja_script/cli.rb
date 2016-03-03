require 'pry'
require 'binding_of_caller'
require 'thor'
require 'ninja_script/commands/generate'

module NinjaScript
  class CLI < Thor
    register NinjaScript::Commands::Generate, 'new', 'new PATH',
      'Creates a NinjaScript at the given path'
  end
end
