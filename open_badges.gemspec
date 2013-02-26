$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_badges/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "open_badges"
  s.version     = OpenBadges::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of OpenBadges."
  s.description = "TODO: Description of OpenBadges."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'bootstrap-sass', '~> 2.3.0.1'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
