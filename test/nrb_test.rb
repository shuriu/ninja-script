require 'test_helper'

class NrbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Nrb::VERSION
  end

  def test_that_it_is_configurable
    refute_nil Nrb.config
  end

  def test_setting_configs
    Nrb.config.my_setting = 42
    assert_equal 42, Nrb.config.my_setting
  end

  def test_default_resources
    refute_empty Nrb.resources
  end

  def test_root_by_config
    Nrb.config.root = 'my_root'
    assert_equal Nrb.root, 'my_root'
    Nrb.config.root = nil
  end

  def test_root_when_config_empty
    Nrb.config.root = nil
    current_path = Dir.pwd
    assert_equal current_path, Nrb.root
  end

  def test_inside_when_outside
    Dir.chdir(__dir__) do
      assert_equal false, Nrb.inside?
    end
  end

  def test_inside_when_inside
    Dir.chdir(fixture_path) do
      assert_equal true, Nrb.inside?
    end
  end
end
