module Nrb
  module Commands
    class Starter < Commands::Inside
      desc 'Require the main file.'

      def start
        require_main_file
      end
    end
  end
end
