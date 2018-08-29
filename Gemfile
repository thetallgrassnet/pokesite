source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'envied', '~> 0.9.0'

gem 'activeadmin', '~> 1.0'
gem 'devise', '~> 4.3'
gem 'paper_trail', '~> 8.0'
gem 'pundit', '~> 1.1.0'
gem 'friendly_id', '>= 5.2.1'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.7'
gem 'fog-aws', '~> 2.0'
gem 'sir_trevor_rails', '~> 0.5.1'
gem 'record_tag_helper', '~> 1.0'
gem 'active_decorator', '~> 0.8'

gem 'webpacker', '~> 3.0'
gem 'slim-rails', '~> 3.1.1'
gem 'foundation-rails', '~> 6.4.1'
gem 'jquery-turbolinks', '~> 2.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'dotenv-rails'
  gem 'foreman'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'mocha'
  gem 'simplecov'
  gem 'poltergeist'
  gem 'launchy'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'newrelic_rpm'
  gem 'raygun4ruby'
  gem 'dalli'
end
gem 'nokogiri', '>= 1.7.1'
