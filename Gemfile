source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'active_model_serializers', '~> 0.10.0'

gem 'pg'
gem 'puma', '~> 3.0'

# Authentication
gem 'devise', '~> 4.2.0'
gem 'jwt', '~> 1.5.4'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Deployment
gem 'capistrano-rails', group: :development

# Security
gem 'rack-cors'
gem 'rack-attack'

# Models
gem 'geocoder'

# Linting
gem 'rubocop'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'rspec-rails', '3.1.0'
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
