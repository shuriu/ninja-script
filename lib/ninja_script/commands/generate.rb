module NinjaScript
  module Commands
    class Generate < Thor::Group
      include Thor::Actions

      argument :path_or_folder_name

      def self.source_root
        File.expand_path('..', __dir__)
      end

      def gemfile
        target_path = File.join(target, 'Gemfile')
        template 'templates/Gemfile.tt', target_path,
          version: NinjaScript::VERSION
      end

      def database_config
        target_path = File.join(target, 'db/config.yml')
        template 'templates/config.yml.tt', target_path,
          db: name
      end

      def script_file
        target_path = File.join(target, name)
        template 'templates/script.tt', target_path
      end

      private

      def target
        File.expand_path(path_or_folder_name)
      end

      def name
        File.basename(path_or_folder_name)
      end
    end
  end
end
