require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  coverage_dir  'test/coverage'
  add_filter    '/test/'
  add_group     'Commands', 'lib/nrb/commands'
  add_group     'Changed' do |source_file|
    `git status --untracked=all --porcelain`.split("\n").detect do |status_and_filename|
      _, filename = status_and_filename.split(' ', 2)
      source_file.filename.ends_with?(filename)
    end
  end
end
Coveralls.wear!

require 'bundler/setup'
require 'nrb'

require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/pride'

class Minitest::Test
  @@fixture_name  = 'script'.freeze
  @@tmp_path      = File.expand_path('../tmp', __dir__)
  @@bin_file      = File.join(File.expand_path('../bin', __dir__) , 'nrb')
  @@templates     = File.join(File.expand_path('../lib/nrb', __dir__))

  def fixture_path(name = @@fixture_name)
    File.expand_path("fixtures/#{name}", __dir__)
  end

  def bin_nrb(*args, **options)
    IO.popen([@@bin_file, *args.map!(&:to_s)]).read.strip
  end

  def nrb(*args, **options, &block)
    runner = Nrb::CLI.new(args, options)
    runner.send(*args, &block)
  end
end
