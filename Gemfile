source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'pg'

# For Heroku
gem 'rails_12factor', group: :production

# User authentication
gem 'devise'

# Background worker of choice
# gem 'sidekiq', '3.2.5'
gem 'whenever', :require => false

# Debugging
gem 'pry'
gem 'pry-rails'

# Env vars
gem 'figaro'

# if you require 'sinatra' you get the DSL extended to Object
gem 'sinatra', '>= 1.3.0', :require => nil

gem 'sidekiq', '3.2.5'

# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.0' # ...with Bootstrap!
gem 'autoprefixer-rails'         # ...goes with Bootstrap.
gem 'sass-rails', '>= 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails'
gem 'font-awesome-rails'
gem 'pundit'

# For Angular asset package management
gem 'bower-rails'

group :development, :test do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'guard-cucumber'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'rails-erd'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

gem 'twilio-ruby'
gem 'newrelic_rpm'
