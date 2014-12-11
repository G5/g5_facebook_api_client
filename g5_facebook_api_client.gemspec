# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'g5_facebook_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "g5_facebook_api_client"
  spec.version       = G5FacebookApiClient::VERSION
  spec.authors       = ["bbauer"]
  spec.email         = ["brian.bauer@g5platform.com"]
  spec.summary       = %q{Facebook Graph Api Client}
  spec.description   = %q{Facebook Graph Api Client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "rspec"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
