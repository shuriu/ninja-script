require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Console < InsideGroup
      desc_with_warning 'Jump into a Pry console with your project loaded'

      def start
        require_main_file
        Pry.start
      end
    end
  end
end
