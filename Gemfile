source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record in development and test environment
group :development, :test do
  gem 'sqlite3'
end

# Use postGreSQL as the database for Active Record in production enviroment
group :production do
   gem 'pg'
   gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# use HttParty to use external API's
gem 'httparty'

# Use cached settings to use API keys etc
gem "rails-settings-cached", "0.3.1"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Bootstrap etc
gem 'bootstrap-sass'
group :development do
  gem 'rails_layout'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# make turbolinks play nice with jquery
gem 'jquery-turbolinks'

# AngularJS
gem 'angularjs-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use webrick as development server
group :development do
  gem 'webrick', '~> 1.3.1'
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development


# Testing libraries

# Use rspec as testing framework
group :development, :test do
  gem 'rspec-rails', '~> 2.0'
end

# Generate fixtures to tests with Factory Girl
group :test do
  # fixtures in tests
  gem 'factory_girl_rails'
  # Headless browser testing
  gem 'capybara'
  gem 'launchy'

  # Use selenium as tests
	gem 'selenium-webdriver'

	# Clean database after doing the tests
	gem 'database_cleaner', '< 1.1.0'


  # Coverage
  gem 'simplecov', :require => false
  # Mocking httpresponses
  gem 'webmock'
end


# Use debugger
gem 'debugger', group: [:development, :test]
