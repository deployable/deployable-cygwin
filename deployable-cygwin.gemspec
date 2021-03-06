# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deployable/cygwin/version'

Gem::Specification.new do |spec|
  spec.name          = "deployable-cygwin"
  spec.version       = Deployable::Cygwin::VERSION
  spec.authors       = ["Matt Hoyle"]
  spec.email         = ["code@deployable.co"]
  spec.summary       = %q{Cygwin helpers for Ruby}
  spec.description   = %q{Contains various cygwin helpers for ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
