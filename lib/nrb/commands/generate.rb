require 'nrb/commands/inside_group'

module Nrb
  module Commands
    class Generate < InsideGroup
      desc_with_warning "Generate a resource (#{Nrb.config.resources.join(', ')})"

      argument :resource, type: :string, required: true,
        desc: 'resource to generate',
        banner: 'RESOURCE',
        enum: Nrb.config.resources.map(&:singularize)

      argument :name, type: :string, required: true,
        desc: 'name of the resource',
        banner: 'NAME'

      def valid_resource?
        valid_resources = Nrb.config.resources.map(&:singularize)
        return if valid_resources.include? resource
        say "RESOURCE must be one of: #{valid_resources.join(', ')}."
        exit
      end

      def generate_resource
        template "templates/#{resource}.rb.tt", target("#{name.underscore}.rb"),
          name: name.camelize
      end

      def create_table
        return unless resource == 'model'

        migration_name = "create_#{name.underscore.pluralize}"
        options = args.join(' ')

        inside Nrb.root do
          run "rake db:new_migration name=#{migration_name} options='#{options}'"
        end
      end

      private

      def target(final = nil)
        File.join(File.expand_path(resource.pluralize), final.to_s)
      end
    end
  end
end
