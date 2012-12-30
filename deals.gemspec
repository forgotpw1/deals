$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deals/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deals"
  s.version     = Deals::VERSION
  s.authors     = ["Barrett Griffith"]
  s.email       = ["mrbarrettgriffith@gmail.com"]
  s.homepage    = "http://www.barrettgriffith.com"
  s.summary     = "Deals API"
  s.description = "Deals API"

  s.files = Dir["{app,bin,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md", "Gemfile", "Gemfile.lock"]
  s.test_files = Dir["test/**/*"]
  s.executables = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "devise"
  s.add_dependency "rails_admin"
  s.add_dependency "carrierwave"
end
