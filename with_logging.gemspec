# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'with_logging/version'

Gem::Specification.new do |spec|
  spec.name          = "with_logging"
  spec.version       = WithLogging::VERSION
  spec.authors       = ["Kirika"]
  spec.email         = ["kirika.k2@gmail.com"]
  spec.description   = %q{SQL logging extension for ActiveRecord::Relation}
  spec.summary       = %q{SQL logging extension for ActiveRecord::Relation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"
  spec.add_dependency "log4r"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry"
end
