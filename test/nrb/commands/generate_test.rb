require 'test_helper'

class Nrb::Commands::GenerateTest < Minitest::Test
  def setup
    @resource    = 'model'
    @name        = 'foo_bar'
    @generator   = Nrb::Commands::Generate.new([@resource, @name], { verbose: false })
    @initial_dir = Dir.pwd

    Dir.chdir(fixture_path)
  end

  def teardown
    Dir.chdir(@initial_dir)
  end

  def test_works_for_valid_resources
    @generator.invoke(:ensure_valid_resource)
  end

  def test_doesnt_work_for_invalid_resources
    assert_raises Nrb::InvalidResourceError do
      Nrb::Commands::Generate.new(['foo', 'foo']).invoke(:ensure_valid_resource)
    end
  end

  def test_generate_resource
    generated_file = @generator.invoke(:generate_resource)
    assert_equal true, File.exist?(generated_file)
    FileUtils.rm(generated_file)
  end

  def test_generate_model_migration
    @generator.invoke(:generate_table)
    generated_file = Dir["**/*_create_#{@name}*.rb"].first
    assert_equal true, File.exist?(generated_file)
    FileUtils.rm(generated_file)
  end
end
