# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pdf/textstream/version"

Gem::Specification.new do |spec|
  spec.name          = "pdf-textstream"
  spec.version       = Pdf::Textstream::VERSION
  spec.authors       = ["Michal Kulesza"]
  spec.email         = ["michal.kulesza@netguru.co"]

  spec.summary       = %q{JRuby gem converting PDF to text keeping the layout}
  spec.homepage      = "https://github.com/mic-kul/pdf-textstream"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.platform = 'java'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
