require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Console < InsideGroup
      desc_with_warning 'Jump into a Pry console with your project loaded'

      class_option :pretend, default: false, type: :boolean,
        desc: 'Pretend opening the console. Useful for testing'

      def start
        required = require_main_file
        Pry.start unless options[:pretend]
        required
      end
    end
  end
end
