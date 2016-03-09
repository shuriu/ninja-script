module Nrb
  module Commands
    class Script < Thor::Group
      include Thor::Actions

      desc 'Creates a Ninja Ruby Script at the given path'

      argument :path_or_folder_name, type: :string, required: true,
        desc: 'The name of the project, or the path.'

      class_option :init_repo, default: true, type: :boolean,
        desc: 'Initialize a repository at the target location',
        aliases: '-r'
      class_option :bundle_install, default: true, type: :boolean,
        desc: 'Run bundle install after generating the skeleton',
        aliases: '-b'

      def self.source_root
        File.expand_path('..', __dir__)
      end

      def gitignore
        template 'templates/.gitignore.tt', target('.gitignore')
      end

      def readme
        template 'templates/README.md.tt', target('README.md'),
          title: name,
          version: Nrb::VERSION
      end

      def gemfile
        template 'templates/Gemfile.tt', target('Gemfile'),
          version: Nrb::VERSION
      end

      def rakefile
        template 'templates/Rakefile.tt', target('Rakefile')
      end

      def config_nrb
        template 'templates/config/nrb.rb.tt', target('config/nrb.rb'),
          resources: Nrb.config.resources
      end

      def resources
        Nrb.config.resources.each do |dir|
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
