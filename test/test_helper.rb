require 'bundler/setup'
require 'coveralls'
Coveralls.wear!
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

  def bin_nrb(*args)
    IO.popen([@@bin_file, *args.map!(&:to_s)]).read.strip
  end

  def nrb(*args, **options, &block)
    runner = Nrb::CLI.new(args, options)
    runner.send(*args, &block)
  end
end
