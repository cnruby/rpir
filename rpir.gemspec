# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rpir/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gudao Luo"]
  gem.email         = ["gudao.luo@gmail.com"]
  gem.description   = %q{WiringRuby's extension for special components}
  gem.summary       = %q{RaspBerryPi WiringPi WiringRuby extension components}
  gem.homepage      = "https://github.com/cnruby/rpir"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rpir"
  gem.require_paths = ["lib"]
  gem.version       = Rpir::VERSION

  gem.add_development_dependency 'rspec', '~> 2.11.0'
  gem.add_development_dependency 'cucumber', '~> 1.2.1'

  gem.add_runtime_dependency 'wiringpi', '~> 1.1.0'
end
