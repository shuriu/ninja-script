module Nrb
  module Commands
    # Command that loads the script and starts a pry console.
    class Console < Commands::Inside
      desc 'Jump into a console with your project loaded.'

      def start
        require_main_file
        Nrb::Utils.console.start
      end
    end
  end
end
