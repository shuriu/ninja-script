require 'simplecov'
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

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'nrb'

require 'minitest/autorun'

class Minitest::Test
  @@fixture_path = File.expand_path('fixtures/fixture_script', __dir__)
end
