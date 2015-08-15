source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'pg'

# For Heroku, remove if deploying elsewhere
gem 'rails_12factor', group: :production

# User authentication
gem 'devise'

# Background worker of choice
gem 'whenever', :require => false
gem 'sidekiq', '3.4.2'
# if you require 'sinatra' you get the DSL extended to Object
gem 'sinatra', '>= 1.3.0', :require => nil

# Env vars
gem 'figaro'

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

# For Angular asset package management
gem 'bower-rails'

# 3rd party APIs
gem 'twilio-ruby'
gem 'newrelic_rpm'

# Administration
gem 'rails_admin', '~> 0.6.7'
gem 'rolify', '~> 4.0'
gem 'cancancan', '~> 1.10'

group :development, :test do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'guard-cucumber'
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'rails-erd'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov'
end
