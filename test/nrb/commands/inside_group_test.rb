require 'test_helper'

class Nrb::Commands::InsideTest < Minitest::Test
  def test_source_root
    assert_equal @@templates, Nrb::Commands::Inside.source_root
  end

  def test_check_inside_when_inside
    Dir.chdir(fixture_path) do
      assert_equal true, Nrb::Commands::Inside.new.invoke(:ensure_inside_root)
    end
  end

  def test_check_inside_when_outside
    assert_raises Nrb::OutsideRootError do
      Nrb::Commands::Inside.new.invoke(:ensure_inside_root)
    end
  end
end
