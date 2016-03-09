module Nrb
  module Commands
    class InsideGroup < Thor::Group
      include Thor::Actions

      class_option :verbose, type: :boolean, default: true,
        desc: 'Verbose mode',
        aliases: '-v'

      def self.warning
        'NOTE: Available inside a NinjaRuby project' unless Nrb.inside?
      end

      def self.desc_with_warning(description)
        self.desc [description, warning].compact.join('. ')
      end

      def self.source_root
        File.expand_path('..', __dir__)
      end

      def check_inside?
        return true if Nrb.inside?
        say_with_command(self.class.to_s)
      end

      private

      def say_with_command(command)
        command = command.split('::').last
        message = "You need to be inside a NinjaRuby folder to run the #{command} command."
        fail Nrb::OutsideRootError, message
      end

      def require_main_file
        assumed_file_name = "#{Nrb.root.split('/').last}.rb"
        assumed_file_path = File.join(Nrb.root, assumed_file_name)

        if File.exist?(assumed_file_path)
          require File.join(Nrb.root, assumed_file_name)
        end
      end
    end
  end
end
