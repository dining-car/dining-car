# frozen_string_literal: true

source "https://rubygems.org"

ruby file: ".ruby-version"

# The framework
gem "rails", "~> 8.1.2"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.6"

# Use falcon as the webserver [https://socketry.github.io/falcon/]
gem "falcon", "~> 0.53"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

gem "devise", "~> 4" # authentication
gem "devise-i18n", "~> 1.15"

gem "kaminari" # used for pagination

gem "pundit" # authorization

gem "babosa" # used with friendly_id to generate unicode slugs
gem "friendly_id", "~> 5.6.0" # generate slugs for recipes

gem "active_storage_validations" # add validations to activestorage
gem "mini_magick" # used for image operations with activestorage

gem "aws-sdk-s3", "~> 1.209", require: false # used in case media is stored in S3, minio or similar

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # .env loading
  gem "dotenv-rails", require: "dotenv/load"

  # Code formatting facilities
  gem "lefthook", require: false
  gem "pronto", "~> 0.11", require: false
  gem "pronto-rubocop", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false # A rubocop extension for Rakefiles
  gem "rubocop-yard", require: false # A rubocop extension for yard documentation

  gem "faker"
  # detects missing locale files, normalize translations, etc
  gem "i18n-tasks"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  gem "letter_opener", "~> 1.7"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "falcon-capybara"

  gem "selenium-webdriver"
  gem "simplecov"
end
