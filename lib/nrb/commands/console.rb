require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Console < InsideGroup
      def start
        require_main_file
        Pry.start
      end
    end
  end
end
