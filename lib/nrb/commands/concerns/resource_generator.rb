require 'active_support/concern'

module Nrb
  module Commands
    module ResourceGenerator
      extend ActiveSupport::Concern

      included do
        argument :resource, type: :string, required: true,
          desc:   'resource type',
          banner: 'resource',
          enum:   Nrb.resources.map(&:singularize)

        argument :name, type: :string, required: true,
          desc:   'name of the resource',
          banner: 'name'
      end

      private

      def target(final = nil)
        File.join(File.expand_path(resource.pluralize), final.to_s)
      end

      def valid_resources
        self.class.valid_resources
      end
    end
  end
end
