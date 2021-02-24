require 'coveralls'
Coveralls.wear!

require_relative 'setup_test_database'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV']    = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

require 'entry'

require_relative '../app'

Capybara.app = DailyDiary



RSpec.configure do |config|
  config.before(:each) { setup_test_database }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
