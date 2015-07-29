# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'x_road/version'

Gem::Specification.new do |spec|
  spec.name          = "x_road"
  spec.version       = XRoad::VERSION
  spec.authors       = ["Janno Siilbek"]
  spec.email         = ["janno.siilbek@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 1.8.7'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'uuidtools', '~> 2.1.5'

  if RUBY_VERSION < '1.9'
    spec.add_dependency 'wasabi', '~> 3.4.0'
    spec.add_dependency 'nori', '~> 2.4.0'
    spec.add_dependency 'httpi', '~> 2.3.0'
    spec.add_dependency 'akami', '~> 1.2.2'
    spec.add_dependency 'nokogiri', '~> 1.5.10'
    spec.add_dependency 'gyoku', '~> 1.2.3'
    spec.add_dependency 'savon', '~> 2.10.1'
  else
    spec.add_dependency 'savon', '~> 2.11.1'
    spec.add_development_dependency 'codeclimate-test-reporter'
  end
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end
