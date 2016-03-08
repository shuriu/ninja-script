require 'pry'
require 'binding_of_caller'
require 'thor'
require 'nrb/commands/generate'

module Nrb
  class CLI < Thor
    register Nrb::Commands::Generate, 'new', 'new PATH',
      'Creates a Nrb at the given path'
  end
end
