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

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "pry"
  spec.add_dependency "pry-byebug"
  spec.add_dependency "binding_of_caller"
  spec.add_dependency "standalone_migrations", "~> 4.0.3"
  spec.add_dependency "sqlite3", "~> 1.3.11"
end
