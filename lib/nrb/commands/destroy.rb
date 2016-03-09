require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Destroy < InsideGroup
      desc_with_warning "Destroy a generated resource"

      argument :resource, type: :string, required: true,
        desc: 'resource to destroy',
        banner: 'RESOURCE',
        enum: Nrb.config.resources.map(&:singularize)

      argument :name, type: :string, required: true,
        desc: 'name of the resource',
        banner: 'NAME'

      def valid_resource?
        valid_resources = Nrb.config.resources.map(&:singularize)
        return true if valid_resources.include? resource
        message = "RESOURCE must be one of: #{valid_resources.join(', ')}."
        fail Nrb::InvalidResourceError, message
      end

      def destroy_resource
        remove_file target("#{name.underscore}.rb")
      end

      def destroy_migration
        return false unless resource == 'model'
        migration_file = Dir["db/migrate/*_create_#{name.underscore.pluralize}.rb"].first
        remove_file migration_file if migration_file
      end

      private

      def target(final = nil)
        File.join(File.expand_path(resource.pluralize), final.to_s)
      end
    end
  end
end
