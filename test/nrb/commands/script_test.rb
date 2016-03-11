require 'test_helper'

class Nrb::Commands::ScriptTest < Minitest::Test
  def setup
    @name      = 'foo_bar'
    @full_path = fixture_path(@name)
    @invoker   = Nrb::Commands::Script.new [@full_path],
      verbose: false,
      local: true,
      bundle_install: false,
      init_repo: false
  end

  def teardown
    FileUtils.rm_rf(@full_path) if Dir.exist?(@full_path)
  end

  def test_gitignore
    file = @invoker.invoke(:gitignore)
    assert_equal true, File.exist?(file)
  end

  def test_readme
    file = @invoker.invoke(:readme)
    assert_equal true, File.exist?(file)
  end

  def test_gemfile
    file = @invoker.invoke(:gemfile)
    assert_equal true, File.exist?(file)
  end

  def test_rakefile
    file = @invoker.invoke(:rakefile)
    assert_equal true, File.exist?(file)
  end

  def test_config_nrb
    file = @invoker.invoke(:config_nrb)
    assert_equal true, File.exist?(file)
  end

  def test_boot
    file = @invoker.invoke(:boot)
    assert_equal true, File.exist?(file)
  end

  def test_db_config
    file = @invoker.invoke(:db_config)
    assert_equal true, File.exist?(file)
  end

  def test_script_file
    file = @invoker.invoke(:script_file)
    assert_equal true, File.exist?(file)
  end

  def test_generated_resources
    @invoker.invoke(:resources)
    Nrb.resources.each do |res|
      file_path = File.join(@full_path, res, '.keep')
      assert_equal true, File.exist?(file_path)
    end
  end

  def test_bundle_install
    other_invoker = Nrb::Commands::Script.new([@full_path], {
      verbose: false, init_repo: false, bundle_install: true, local: true
    })

    other_invoker.invoke(:gemfile)
    other_invoker.invoke(:bundle_install)

    assert_equal true, File.exist?(File.join(@full_path, 'Gemfile.lock'))
  end

  def test_initialize_repo
    other_invoker = Nrb::Commands::Script.new([@full_path], {
      verbose: false, init_repo: true, bundle_install: false
    })

    other_invoker.invoke(:initialize_repo)

    assert_equal true, Dir.exist?(File.join(@full_path, '.git'))
  end
end
