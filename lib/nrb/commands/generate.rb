module Nrb
  module Commands
    # This command generates a resource, and if it is a model, it also
    # generates the correspnding create migration file.
    class Generate < Commands::Resource
      desc "Generate a resource (#{valid_resources.join(', ')})."

      def generate_resource
        template "templates/#{resource}.rb.tt", target("#{name.underscore}.rb"),
          opts.merge({ name: name.camelize })
      end

      def generate_table
        return false unless resource == 'model'

        inside Nrb.root, opts do
          Nrb::Utils.silently do
            generate_table_file
          end
        end
      end

      private

      def generate_table_file
        migration_name = "create_#{name.underscore.pluralize}"
        rake_options   = args.join(' ')
        command        = "bundle exec rake db:new_migration"
        run "#{command} name=#{migration_name} options='#{rake_options}'", opts
      end
    end
  end
end
