# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonapi/resources/filterer/version'

Gem::Specification.new do |spec|
  spec.name          = "jsonapi-resources-filterer"
  spec.version       = JSONAPI::Resources::Filterer::VERSION
  spec.authors       = ["G5", "Ramon Tayag", "Marc Ignacio"]
  spec.email         = ["lateam@getg5.com", "ramon.tayag@gmail.com", "marcrendlignacio@gmail.com"]

  spec.summary       = %q{Filterer integration with jsonapi-resources}
  spec.description   = %q{Integration between filterer and jsonapi-resources}
  spec.homepage      = "https://github.com/g5/jsonapi-resources-filterer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jsonapi-resources"
  spec.add_dependency "filterer"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activerecord", ">= 3.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "jsonapi-resources-matchers"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "database_cleaner", "~> 1.4"
end
