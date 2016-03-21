require 'test_helper'

class Nrb::Commands::ConsoleTest < Minitest::Test
  def test_that_it_starts_the_console
    Dir.chdir fixture_path do
      @invoker = Nrb::Commands::Console.new
      @invoker.stub :start, :required do
        required = @invoker.start
        assert_equal :required, required
      end
    end
  end
end
