module Nrb
  module Commands
    # This class is the base class for other thor groups.
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
        root = Nrb.root
        assumed_file_name = "#{root.split('/').last}.rb"
        assumed_file_path = File.join(root, assumed_file_name)
        return false unless File.exist?(assumed_file_path)

        require assumed_file_path
      end
    end
  end
end
