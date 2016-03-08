module Nrb
  module Commands
    class InsideGroup < Thor::Group
      include Thor::Actions

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
        return if Nrb.inside?
        klass_name = self.class.to_s.split('::').last
        say "You need to be inside a NinjaRuby folder to run the #{klass_name} command."
        exit
      end

      private

      def require_main_file
        assumed_file_name = "#{Nrb.root.split('/').last}.rb"
        assumed_file_path = File.join(Nrb.root, assumed_file_name)

        if File.exist?(assumed_file_path)
          require File.join(Nrb.root, assumed_file_name)
        else
          say 'Could not load file :(.'
          exit
        end
      end
    end
  end
end
