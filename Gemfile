source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0.dev"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.8', '>= 4.8.1'

# A generalized Rack framework for multiple-provider authentication.
gem 'omniauth', '~> 2.1'

# Google OAuth2 strategy for OmniAuth 1.x.
gem 'omniauth-google-oauth2', '~> 1.1', '>= 1.1.1'

# implementing a CSRF token verifier that directly utilize RequestForgeryProtection
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.1'

# Autoload dotenv in Rails.
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

# A Ruby wrapper for Gravatar URLs
gem 'gravtastic', '~> 3.2', '>= 3.2.6'

# Very simple Roles library without any authorization enforcement
gem 'rolify', '~> 6.0'

gem "letter_opener", group: :development

# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1', require: true

# To use sass with sprockets
gem 'sass-rails'

# Sprockets for Sass compilation
gem 'sassc-rails'



# Active Admin is a framework for creating administration style interfaces
gem 'activeadmin'


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
