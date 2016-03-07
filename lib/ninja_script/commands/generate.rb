module NinjaScript
  module Commands
    class Generate < Thor::Group
      include Thor::Actions

      argument :path_or_folder_name

      def self.source_root
        File.expand_path('..', __dir__)
      end

      def gitignore
        template 'templates/.gitignore.tt', target('.gitignore')
      end

      def readme
        template 'templates/README.md.tt', target('README.md'),
          title: name
      end

      def gemfile
        template 'templates/Gemfile.tt', target('Gemfile'),
          version: NinjaScript::VERSION
      end

      def rakefile
        template 'templates/Rakefile.tt', target('Rakefile')
      end

      def config
        template 'templates/config/config.rb.tt', target('config/config.rb'),
          directories: NinjaScript.config.directories
      end

      def boot
        template 'templates/config/boot.rb.tt', target('config/boot.rb')
      end

      def db_config
        template 'templates/db/config.yml.tt', target('db/config.yml'),
          db: name
      end

      def script_file
        template 'templates/script.rb.tt', "#{target(name)}.rb"
      end

      def initialize_repo
        Dir.chdir(target) do
          %x(git init)
        end
      end

      private

      def target(final = nil)
        File.join(File.expand_path(path_or_folder_name), final.to_s)
      end

      def name
        File.basename(path_or_folder_name)
      end
    end
  end
end
