require 'pathname'

module Nrb
  module Commands
    class Script < Commands::Base
      desc 'Creates a Ninja Ruby Script at the given path.'

      argument :path_or_folder_name, type: :string, required: true,
        desc: 'The name of the project, or the path.'

      class_option :init_repo, default: true, type: :boolean,
        desc: 'Initialize a repository at the target location.',
        aliases: '-r'

      class_option :bundle_install, default: false, type: :boolean,
        desc: 'Run bundle install after generating the skeleton.',
        aliases: '-b'

      class_option :local, default: false, type: :boolean,
        desc: 'Add local path of the gem when generating the Gemfile. Useful for testing.'

      def gitignore
        template 'templates/.gitignore.tt', target('.gitignore'), opts
      end

      def readme
        template 'templates/README.md.tt', target('README.md'),
          opts.merge({ title: name, version: Nrb::VERSION })
      end

      def gemfile
        template 'templates/Gemfile.tt', target('Gemfile'),
          opts.merge({ nrb_gem: nrb_gem })
      end

      def rakefile
        template 'templates/Rakefile.tt', target('Rakefile'), opts
      end

      def config_nrb
        template 'templates/config/nrb.rb.tt', target('config/nrb.rb'),
          opts.merge({ resources: Nrb.resources })
      end

      def resources
        Nrb.resources.each do |dir|
          create_file target("#{dir}/.keep"), opts
        end
      end

      def boot
        template 'templates/config/boot.rb.tt', target('config/boot.rb'), opts
      end

      def db_config
        template 'templates/db/config.yml.tt', target('db/config.yml'),
          opts.merge({ db: name })
      end

      def script_file
        template 'templates/script.rb.tt', "#{target(name)}.rb", opts
      end

      def initialize_repo
        return unless options[:init_repo]

        inside target, opts do
          Nrb::Utils.silently verbose: options[:verbose] do
            run 'git init'
          end
        end
      end

      def bundle_install
        return unless options[:bundle_install]

        inside target, opts do
          Bundler.with_clean_env do
            Nrb::Utils.silently verbose: options[:verbose] do
              run 'bundle install'
            end
          end
        end
      end

      private

      def nrb_gem
        text = "gem 'nrb', '#{Nrb::VERSION}'"

        if options[:local]
          local_gem_path = Pathname.new(File.expand_path('../../..', __dir__))
          target_path    = Pathname.new(target)
          relative_path  = local_gem_path.relative_path_from(target_path)
          text << ", path: '#{relative_path}'"
        end

        text
      end

      def target(final = nil)
        File.join(File.expand_path(path_or_folder_name), final.to_s)
      end

      def name
        File.basename(path_or_folder_name)
      end
    end
  end
end
