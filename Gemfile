source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'bootsnap', require: false
gem 'listen', '~> 3.0'
gem 'fast_jsonapi', '1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '4.3.11'
gem 'sentry-raven', '2.9.0'
gem 'sidekiq', '~> 5.2'
gem 'sidekiq-scheduler', '~> 2.0', '>= 2.0.8'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'activerecord-import', '~> 1.0', '>= 1.0.2'

group :development, :test do
  gem 'factory_bot', '4.11.1'
end

group :development, :test do
  gem 'pry', '0.12.2'
end

group :test do
  gem "database_cleaner", '1.7.0'
  gem 'factory_bot_rails', '4.11.1'
  gem 'faker', '1.9.1'
  gem 'rspec-rails', '3.8.0'
  gem 'rspec_junit_formatter', '0.4.1'
  gem 'rspec-collection_matchers', '1.1.3'
  gem 'shoulda-matchers', '~> 3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
