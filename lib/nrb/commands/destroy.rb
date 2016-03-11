module Nrb
  module Commands
    # This command destroys a resource, and if it is a model, it also destroys
    # the correspnding create migration file.
    class Destroy < Commands::Resource
      desc 'Destroy a generated resource.'

      def destroy_resource
        remove_file target("#{name.underscore}.rb"), opts
      end

      def destroy_migration
        return false unless resource == 'model'
        prefix = 'db/migrate/*_create_'
        migration_file = Dir["#{prefix}#{name.underscore.pluralize}.rb"].first
        remove_file(migration_file, opts)
      end
    end
  end
end
