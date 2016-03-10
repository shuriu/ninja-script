require 'test_helper'

class Nrb::Commands::InsideGroupTest < Minitest::Test
  def test_source_root
    assert_equal @@templates, Nrb::Commands::InsideGroup.source_root
  end

  def test_check_inside_when_inside
    Dir.chdir(fixture_path) do
      assert_equal true, Nrb::Commands::InsideGroup.new.invoke(:check_inside?)
    end
  end

  def test_check_inside_when_outside
    assert_raises Nrb::OutsideRootError do
      Nrb::Commands::InsideGroup.new.invoke(:check_inside?)
    end
  end
end
