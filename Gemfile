source 'https://rubygems.org'

ruby '2.7.2'

group :development, :production do
  gem 'rack'
  gem 'puma'
  gem 'sinatra'
end

group :development, :test, :production do
  gem 'pg'
  gem 'rake'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'rspec'
  gem 'rubocop'
end
