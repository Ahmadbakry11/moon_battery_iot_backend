# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'pundit', '~> 2.4'
gem 'rails', '~> 7.1.5'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'awesome_print', '~> 1.8'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'rubocop-rails-omakase', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 6.1'
end
