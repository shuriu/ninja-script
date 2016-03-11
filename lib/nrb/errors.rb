module Nrb
  # Raised when a command that needs to be run inside a project root,
  # is actually ran outside.
  class OutsideRootError < Thor::Error; end

  # Raised when a command that needs to generate or destroy a resource,
  # needs a name, and the name supplied is wrong.
  class InvalidResourceError < Thor::Error; end
end
