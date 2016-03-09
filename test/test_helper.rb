$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'nrb'

require 'minitest/autorun'

class Minitest::Test
  @@fixture_path = File.expand_path('fixtures/fixture_script', __dir__)
end
