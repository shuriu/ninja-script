require 'test_helper'

class Nrb::CLITest < Minitest::Test
  def test_has_help_text
    refute_empty nrb
  end

  def test_has_valid_version
    assert_equal Nrb::VERSION, nrb('-v')
  end

  def test_has_required_commands
    required = %w(new generate destroy start console)
    assert_equal required.sort, Nrb::CLI.tasks.keys.sort
  end
end
