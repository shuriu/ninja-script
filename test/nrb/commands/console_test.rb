require 'test_helper'

class Nrb::Commands::ConsoleTest < Minitest::Test
  def test_that_it_starts_the_console
    Dir.chdir fixture_path do
      required = Nrb::Commands::Console.new.invoke('start', [], pretend: true)
      refute_nil required
    end
  end
end
