require 'test_helper'

class Nrb::Commands::ConsoleTest < Minitest::Test
  def test_that_it_starts_the_console
    Dir.chdir fixture_path do
      Nrb::Utils.console.stub :start, :started do
        message = Nrb::Commands::Console.new.invoke('start', [], {})
        assert_equal :started, message
      end
    end
  end
end
