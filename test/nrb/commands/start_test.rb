require 'test_helper'

class Nrb::Commands::StartTest < Minitest::Test
  def test_that_it_requires_the_main_file
    Dir.chdir fixture_path do
      required = Nrb::Commands::Starter.new.invoke('start')
      refute_nil required
    end
  end
end
