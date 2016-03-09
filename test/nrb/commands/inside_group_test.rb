require 'test_helper'

class Nrb::Commands::InsideGroupTest < Minitest::Test
  def test_source_root
    assert_equal Nrb::Commands::InsideGroup.source_root, @@templates
  end

  def test_check_inside_when_inside
    Dir.chdir(fixture_path) do
      assert_equal Nrb::Commands::InsideGroup.new.invoke(:check_inside?), true
    end
  end

  def test_check_inside_when_inside
    assert_raises Nrb::OutsideProjectRootError do
      Nrb::Commands::InsideGroup.new.invoke(:check_inside?)
    end
  end
end
