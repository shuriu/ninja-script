require 'test_helper'

class Nrb::Commands::StarterTest < Minitest::Test
  def test_that_it_requires_the_main_file
    Dir.chdir fixture_path do
      required = Nrb::Commands::Starter.new.invoke('start')
      refute_nil required
    end
  end

  def test_that_it_requires_the_directories_inside_autoload_paths
    Dir.chdir fixture_path do
      Nrb::Commands::Starter.new.invoke('start')
      assert_equal 'constant', defined?(User)
      assert_equal 'constant', defined?(UserService)
    end
  end
end
