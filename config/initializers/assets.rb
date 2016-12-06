# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Vault::Engine.config.assets.version = "1.0"

# Add folder with webpack generated assets to assets.paths
Vault::Engine.config.assets.paths << Rails.root.join("app", "assets", "webpack")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Vault::Engine.config.assets.precompile << "server-bundle.js"

type = ENV["REACT_ON_RAILS_ENV"] == "HOT" ? "non_webpack" : "static"
Vault::Engine.config.assets.precompile +=
  [
    "application_#{type}.js",
    "application_#{type}.css"
  ]