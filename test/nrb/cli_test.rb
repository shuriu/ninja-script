require 'test_helper'

class Nrb::CLITest < Minitest::Test
  def test_has_help_text
    text = bin_nrb
    refute_empty text
  end

  def test_has_valid_version
    version = bin_nrb '-v'
    assert_equal version, Nrb::VERSION
  end

  def test_has_required_commands
    required = %w(new generate destroy start console).sort
    assert_equal Nrb::CLI.tasks.keys.sort, required
  end
end
