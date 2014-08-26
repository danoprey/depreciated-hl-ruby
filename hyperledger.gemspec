# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hyperledger/version'

Gem::Specification.new do |spec|
  spec.name          = "hyperledger"
  spec.version       = Hyperledger::VERSION
  spec.authors       = ["Daniel Feichtinger"]
  spec.email         = ["df@hyperledger.org"]
  spec.summary       = "Ruby bindings for the hyperledger protocol."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 5.4"
  spec.add_development_dependency "webmock", "~> 1.18"
  
  spec.add_runtime_dependency "rest_client", "~> 1.7"
  spec.add_runtime_dependency "thor", "~> 0.19"
end
