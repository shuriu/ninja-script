require 'test_helper'

class Nrb::Commands::DestroyTest < Minitest::Test
  def setup
    @resource        = 'model'
    @name            = 'foo_bar'
    @generator       = Nrb::Commands::Generate.new([@resource, @name], { verbose: false })
    @destroyer       = Nrb::Commands::Destroy.new([@resource, @name], { verbose: false })
    @initial_dir     = Dir.pwd

    Dir.chdir(fixture_path)
  end

  def teardown
    Dir.chdir(@initial_dir)
  end

  def test_works_for_valid_resources
    @destroyer.invoke(:ensure_valid_resource)
  end

  def test_doesnt_work_for_invalid_resources
    assert_raises Nrb::InvalidResourceError do
      Nrb::Commands::Destroy.new(['foo', 'foo']).invoke(:ensure_valid_resource)
    end
  end

  def test_destroy_resource
    generated_file = @generator.invoke(:generate_resource)
    @destroyer.invoke(:destroy_resource)
    refute_equal true, File.exist?(generated_file)
  end

  def test_destroy_migration
    Bundler.with_clean_env do
      @generator.invoke(:generate_table)
      generated_file = Dir["**/*_create_#{@name}*.rb"].first.to_s
      @destroyer.invoke(:destroy_migration)

      # FIXME: Investigate why this is needed
      FileUtils.rm(generated_file) if File.exist?(generated_file)

      assert_equal false, File.exist?(generated_file)
    end
  end
end
