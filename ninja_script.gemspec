# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ninja_script/version'

Gem::Specification.new do |spec|
  spec.name          = "ninja_script"
  spec.version       = NinjaScript::VERSION
  spec.authors       = ["shuriu"]
  spec.email         = ["stefan.rotariu@gmail.com"]

  spec.summary       = %q{Idea scaffolds with easy persistence for your experimenting needs.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["ninja-script"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "pry", "~> 0.10"
  spec.add_dependency "pry-byebug", "~> 3.3"
  spec.add_dependency "binding_of_caller", "~> 0.7"
  spec.add_dependency "standalone_migrations", "~> 4.0"
  spec.add_dependency "sqlite3", "~> 1.3"
end
