module Nrb
  module Commands
    # This class fires a task that checks if the following command
    # is done inside the root of the project.
    class Inside < Commands::Base
      def ensure_inside_root
        return true if Nrb.inside?
        fail_outside_root
      end

      private

      def fail_outside_root
        command = self.class.to_s.split('::').last

        fail Nrb::OutsideRootError,
          'You need to be inside a NinjaRuby folder' \
          "to run the #{command} command."
      end
    end
  end
end
