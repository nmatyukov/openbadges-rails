$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_badges/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "open_badges"
  s.version     = OpenBadges::VERSION
  s.authors     = ["Eldwin Liew", "Andrew Eng"]
  s.email       = ["eldwin_@hotmail.com", "andrew.engwy@gmail.com"]
  s.homepage    = "https://github.com/eldwin/openbadges-rails"
  s.summary     = "Ruby on Rails Open Badges Issuer"
  s.description = "Ruby on Rails Open Badges Issuer"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.md", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.12'
  s.add_dependency 'devise', '~> 2.2.3'
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'bootstrap-sass', '~> 2.3.0.1'
  s.add_dependency 'select2-rails', '~> 3.3.1'
  s.add_dependency 'will_paginate', '~> 3.0'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
