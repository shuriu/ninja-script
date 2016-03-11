require 'pathname'
require 'nrb/commands/concerns/script_generator'

module Nrb
  module Commands
    # This command generates a new script scaffold.
    class Script < Commands::Base
      include ScriptGenerator

      desc 'Creates a Ninja Ruby Script at the given path.'

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
          try_loud_command('git init')
        end
      end

      def bundle_install
        return unless options[:bundle_install]

        inside target, opts do
          Bundler.with_clean_env do
            try_loud_command('bundle install')
          end
        end
      end
    end
  end
end
