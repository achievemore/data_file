# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_file/version'

Gem::Specification.new do |spec|
  spec.name          = "data_file"
  spec.version       = DataFile::VERSION
  spec.authors       = ["Bruno Azisaka Maciel"]
  spec.email         = ["bruno@azisaka.com.br"]
  spec.summary       = %q{Open data files with .csv, .txt, .xls, .xlsx extensions.}
  spec.description   = %q{With a parser and file detector, you just need to provide the file and it will do the rest.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
