module Nrb
  module Commands
    class Generate < Commands::Resource
      desc "Generate a resource (#{valid_resources.join(', ')})."

      def generate_resource
        template "templates/#{resource}.rb.tt", target("#{name.underscore}.rb"),
          opts.merge({ name: name.camelize })
      end

      def generate_table
        return false unless resource == 'model'

        migration_name = "create_#{name.underscore.pluralize}"
        rake_options   = args.join(' ')

        inside Nrb.root, opts do
          Nrb.silently(opts) do
            run "bundle exec rake db:new_migration name=#{migration_name} options='#{rake_options}'",
              opts
          end
        end
      end
    end
  end
end
