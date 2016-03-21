require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/pride'


require 'nrb'
class Minitest::Test
  @@fixture_name  = 'script'.freeze
  @@tmp_path      = File.expand_path('../tmp', __dir__)
  @@bin_file      = File.join(File.expand_path('../bin', __dir__) , 'nrb')
  @@templates     = File.join(File.expand_path('../lib/nrb', __dir__))

  def fixture_path(name = @@fixture_name)
    File.expand_path("fixtures/#{name}", __dir__)
  end

  def nrb(*args)
    output = ''
    Dir.chdir fixture_path do
      output = IO.popen([@@bin_file, *args.map(&:to_s)]).read.strip
    end
    output
  end
end
