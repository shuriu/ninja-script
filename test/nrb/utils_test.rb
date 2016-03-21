require 'test_helper'

class NrbUtilsTest < Minitest::Test
  def test_console_responds_to_start
    assert_respond_to Nrb::Utils.console, :start
  end
end
