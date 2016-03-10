require 'nrb/commands/concerns/resource_generator'

module Nrb
  module Commands
    class Destroy < Commands::Resource
      desc 'Destroy a generated resource.'

      def destroy_resource
        remove_file target("#{name.underscore}.rb"), opts
      end

      def destroy_migration
        return false unless resource == 'model'
        migration_file = Dir["db/migrate/*_create_#{name.underscore.pluralize}.rb"].first
        remove_file(migration_file, opts) if migration_file
      end
    end
  end
end
