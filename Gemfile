source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'bootsnap', require: false
gem 'listen', '~> 3.0'
gem 'logstash-logger', '0.26.1'
#gem 'logstash-event', '1.2.02'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.2'
gem 'aws-sdk-autoscaling'#, '3.0.1'
gem "aws-sdk-ec2"
gem "aws-sdk-dynamodb"
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
gem 'progress_bar', '1.3.0'
# Use Puma as the app server
gem 'puma', '4.0.0'
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

group :development, :test, :staging do
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
  gem 'simplecov', '0.16.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'whenever', '1.0.0', require: false

group :development do
  #for cap deploy
  gem 'capistrano', '3.11.0'
  gem 'capistrano3-puma', '4.0.0'
  gem 'capistrano-db-tasks', '~> 0.6', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', '~> 2.3', require: false
  gem 'capistrano-rails-db', '0.0.2'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rake', require: false
  gem 'capistrano-rvm', '0.1.2'
  gem 'capistrano-secrets-yml', '~> 1.1.0'
  gem 'capistrano-sidekiq'#, github: 'seuros/capistrano-sidekiq'
  gem 'net-ssh', '4.2.0'
end
