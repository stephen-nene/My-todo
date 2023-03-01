# Sets the value of RACK_ENV to "development" if it's not already set.
# This is often used to configure different settings for different environments (e.g., development, test, production).
ENV["RACK_ENV"]||= "development"

# Loads all gems listed in the Gemfile, as well as any gems specified for the current environment (e.g., development or test).
# This ensures that all required dependencies are available for the application to run.

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

require_all "app"
