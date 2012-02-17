$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "windbag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "windbag"
  s.version     = Windbag::VERSION
  s.authors     = ["Logan Koester"]
  s.email       = ["lkoester@majorleaguegaming.com"]
  s.homepage    = "http://github.com/agoragames/windbag"
  s.summary     = "Notification System for Rails 3.1+"
  s.description = "Windbag is the event notification system extracted from MLG Starcraft Arena"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
end
