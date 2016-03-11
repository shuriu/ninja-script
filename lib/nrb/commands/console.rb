module Nrb
  module Commands
    # Command that loads the script and starts a pry console.
    class Console < Commands::Inside
      desc 'Jump into a Pry console with your project loaded.'

      class_option :pretend, default: false, type: :boolean,
        desc: 'Pretend opening the console. Useful for testing.'

      def start
        required = require_main_file
        Pry.start unless options[:pretend]
        required
      end
    end
  end
end
