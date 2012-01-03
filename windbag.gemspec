$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "windbag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "windbag"
  s.version     = Windbag::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Windbag."
  s.description = "TODO: Description of Windbag."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
