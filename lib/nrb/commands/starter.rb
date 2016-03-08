require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Starter < InsideGroup
      def start
        require_main_file
      end
    end
  end
end
