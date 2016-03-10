module Nrb
  module Commands
    class Base < Thor::Group
      include Thor::Actions

      class_option :verbose, type: :boolean, default: true,
        desc:    'Verbose mode.',
        aliases: '-v'

      def self.source_root
        File.expand_path('../..', __dir__)
      end

      def opts
        options.to_h.symbolize_keys
      end

      private

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
