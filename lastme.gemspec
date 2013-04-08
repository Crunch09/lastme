# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lastme/version'

Gem::Specification.new do |spec|
  spec.name          = "lastme"
  spec.version       = Lastme::VERSION
  spec.authors       = ["Florian Thomas"]
  spec.email         = ["flo@florianthomas.net"]
  spec.description   = %q{Play last.fm from your commandline.}
  spec.summary       = %q{last.fm songs are streamed via mpd directly to your commandline.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "dotenv"
  spec.add_dependency "json"
end
