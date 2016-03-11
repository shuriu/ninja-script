module Nrb
  module Commands
    # Command that loads the script.
    class Starter < Commands::Inside
      desc 'Require the main file.'

      def start
        require_main_file
      end
    end
  end
end
