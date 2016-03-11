module Nrb
  # Utility methods to be used in other places.
  module Utils
    module_function

    # Supress STDOUT for the duration of the block.
    def silently
      original = $stdout.dup
      $stdout.reopen(File::NULL)
      yield
      $stdout.reopen(original)
    end
  end
end
