source 'https://rubygems.org'

ruby '2.7.2'

group :development, :production do
  gem 'rack'
  gem 'puma'
  gem 'sinatra'
end

group :development, :test, :production do
  gem 'pg'
end

group :development, :test do
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'rspec'
end
