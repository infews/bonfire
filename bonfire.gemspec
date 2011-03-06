# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bonfire/version"

Gem::Specification.new do |s|
  s.name        = "bonfire"
  s.version     = Bonfire::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Davis W. Frank"]
  s.email       = ["dwfrank+bonfire@infe.ws"]
  s.homepage    = "http://infews.github.com/bonfire"
  s.summary     = %q{Ruby for eBooks}
  s.description = %q{All the scripts you need to write books in Markdown then publish them via Amazon's Kindle
Digital Publishing.}

  s.rubyforge_project = "bonfire"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'tilt', '>= 1.2.2'
  s.add_dependency 'haml', '>= 3.0'
  s.add_dependency 'thor', '>= 0.14.0'
  s.add_dependency 'rdiscount', '>= 1.6.8'

  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "gem-release"
end
