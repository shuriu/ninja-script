require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Starter < InsideGroup
      desc_with_warning "Require the main file"

      def start
        require_main_file
      end
    end
  end
end
