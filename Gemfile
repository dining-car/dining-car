# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 5.2.4"
gem "pg", "~> 1"
gem "puma", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "uglifier"

gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.10"

gem "dotenv-rails", "~> 2.7.5" # loads .env.production automatically

gem "devise", "~> 4" # authentication
gem "devise-i18n", "~> 1.9"

gem "bootsnap", ">= 1.1.0", require: false # speed-up rails startup

gem "bulma-rails" # css framework

gem "kaminari" # used for pagination

gem "pundit" # authorization

gem "cocoon" # interactive nested resources forms

gem "friendly_id", "~> 5.3.0" # generate slugs for recipes
gem "babosa" # used with friendly_id to generate unicode slugs

gem "active_storage_validations" # add validations to activestorage
gem "mini_magick" # used for image operations with activestorage

gem "aws-sdk-s3", "~> 1.67", require: false # used in case media is stored in S3, minio or similar

group :development, :test do
  gem "pry-byebug"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.79.0", require: false
  gem "rubocop-performance", require: false
  gem "lefthook", require: false
  gem "pronto", github: "prontolabs/pronto", require: false # Until release of version with thor 1.0
  gem "pronto-rubocop", require: false # Until release of version with thor 1.0
  gem "faker"
  # detects missing locale files, normalize translations, etc
  gem "i18n-tasks"
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "letter_opener", "~> 1.7"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "simplecov"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
