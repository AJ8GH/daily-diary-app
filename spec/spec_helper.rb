require 'coveralls'
Coveralls.wear!

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV']    = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'

require_relative '../app'

Capybara.app = DailyDiary

Rake.application.load_rakefile


RSpec.configure do |config|
  config.before(:suite) { Rake::Task['db:connect'].execute }
  config.before(:each) { Rake::Task['db:clean'].execute }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
