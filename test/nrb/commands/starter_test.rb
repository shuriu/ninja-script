require 'test_helper'

class Nrb::Commands::StarterTest < Minitest::Test
  def test_that_it_requires_the_main_file
    Dir.chdir fixture_path do
      @invoker = Nrb::Commands::Starter.new
      @invoker.stub :start, :required do
        required = @invoker.start
        assert_equal :required, required
      end
    end
  end
end
