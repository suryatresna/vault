$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vault/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vault"
  s.version     = Vault::VERSION
  s.authors     = ["Surya Tresna"]
  s.email       = ["surya.tresna@go-jek.com"]
  s.homepage    = "http://www.go-jek.com"
  s.summary     = "Vault: Summary of Vault."
  s.description = "Vault: Description of Vault."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "devise"

  s.add_development_dependency "sqlite3"
end
