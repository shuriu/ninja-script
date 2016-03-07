module NinjaScript
  module Commands
    class Generate < Thor::Group
      include Thor::Actions

      argument :path_or_folder_name, type: :string

      class_option :repo,   default: true, type: :boolean
      class_option :bundle, default: true, type: :boolean

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

      def directories
        NinjaScript.config.directories.each do |dir|
          create_file target("#{dir}/.keep")
        end
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
        return unless options[:repo]

        inside target, verbose: true do
          run 'git init'
        end
      end

      def bundle_install
        return unless options[:bundle]

        inside target, verbose: true do
          run 'bundle install'
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
