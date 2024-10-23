# frozen_string_literal: true

source 'https://nexus.vinted.net/repository/rubygems-proxy-repos-group/'
private_gem_source = 'https://nexus.vinted.net/repository/rubygems-cloudsmith-repos-group/'

gem 'active_model_serializers' # for object serialization
gem 'interactor-initializer' # to be used for writing interactors

gem 'kaminari'

# ORIGINAL FILE CONTENT:
# source "https://rubygems.org"
#
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.1', '>= 7.2.1.1'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(windows jruby)

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i(mri windows), require: 'debug/prelude'
  gem 'factory_bot_rails' # for creating spec fixtures
  gem 'pry' # use binding.pry to stop execution and open console session for debugging
  gem 'pry-byebug' # enhances pry with debugging capabilities (see https://github.com/deivid-rodriguez/pry-byebug)
  gem 'rspec'
  gem 'rspec-rails' # we skipped default testing framework for rails with -T and are using rspec instead

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false

  group :development do
    gem 'rubocop', '>= 1.49.0', require: false
    gem 'vinted-rubocop', '>= 1.6.0', require: false, source: private_gem_source
  end
end
