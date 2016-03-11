module Nrb
  module Commands
    # This class fires a task that checks if the following command
    # is done on the correct resource type.
    class Resource < Commands::Inside
      include ResourceGenerator

      def self.valid_resources
        arguments.find { |arg| arg.name == 'resource' }.enum
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
