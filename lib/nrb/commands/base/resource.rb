module Nrb
  module Commands
    class Resource < Commands::Inside
      include ResourceGenerator

      def self.valid_resources
        arguments.find { |a| a.name == 'resource' }.enum
      end

      def ensure_valid_resource
        return true if valid_resources.include? resource
        fail_invalid_resource
      end

      private

      def fail_invalid_resource
        fail Nrb::InvalidResourceError,
          "<resource> must be one of: #{valid_resources.join(', ')}."
      end
    end
  end
end
