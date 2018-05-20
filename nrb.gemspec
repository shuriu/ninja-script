# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nrb/version'

Gem::Specification.new do |spec|
  spec.name          = "nrb"
  spec.version       = Nrb::VERSION
  spec.authors       = ["shuriu"]
  spec.email         = ["stefan.rotariu@gmail.com"]

  spec.summary       = %q{Ninja Ruby scripts with easy persistence for your experimenting needs.}
  spec.homepage      = "https://github.com/shuriu/nrb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["nrb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3.1"
  spec.add_development_dependency "guard", "~> 2.14.2"
  spec.add_development_dependency "minitest", "~> 5.11"
  spec.add_development_dependency "guard-minitest", "~> 2.4.0"
  spec.add_development_dependency "rubocop", "~> 0.56.0"
  spec.add_development_dependency "guard-rubocop", "~> 1.2.0"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
  spec.add_dependency "activesupport", "~> 5.2.0"
  spec.add_dependency "thor", "~> 0.19"
end
