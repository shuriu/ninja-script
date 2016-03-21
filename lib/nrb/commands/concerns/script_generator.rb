module Nrb
  module Commands
    # This module adds the :path_or_folder_name required argument,
    # and some helper flags like: --init-repo, --bundle-install, --local.
    module ScriptGenerator
      extend ActiveSupport::Concern

      included do
        argument :path_or_folder_name, type: :string, required: true,
          desc: 'The name of the project, or the path.'

        class_option :init_repo, default: true, type: :boolean,
          desc: 'Initialize a repository at the target location.',
          aliases: '-r'

        class_option :bundle_install, default: false, type: :boolean,
          desc: 'Run bundle install after generating the skeleton.',
          aliases: '-b'

        class_option :local, default: false, type: :boolean,
          desc: 'Add local path of the gem when ' \
                'generating the Gemfile. Useful for testing.'
      end

      private

      def try_loud_command(command)
        opts[:verbose] ? run(command) : silent_command(command)
      end

      def silent_command(command)
        Nrb::Utils.silently { run command }
      end

      def target(final = nil)
        File.join(File.expand_path(path_or_folder_name), final.to_s)
      end

      def name
        File.basename(path_or_folder_name)
      end

      def nrb_gem
        text = "gem 'nrb', '#{Nrb::VERSION}'"
        add_local_path(text) if options[:local]
        text
      end

      def add_local_path(text)
        local_gem_path = Pathname.new(File.expand_path('../../../..', __dir__))
        target_path    = Pathname.new(target)
        relative_path  = local_gem_path.relative_path_from(target_path)
        text << ", path: '#{relative_path}'"
      end
    end
  end
end
