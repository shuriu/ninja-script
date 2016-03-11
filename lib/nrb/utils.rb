module Nrb
  module Utils
    module_function

    # Supress STDOUT for the duration of the block.
    def silently(verbose: false)
      yield and return if verbose

      original_stdout = $stdout.dup
      $stdout.reopen(File::NULL)

      yield

      $stdout.reopen(original_stdout)
    end
  end
end
