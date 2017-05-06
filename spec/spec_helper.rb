ENV['RACK_ENV'] = 'test'
#
# require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')
require 'dm-postgres-adapter'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/models/link'
require './app/models/tag'
require 'database_cleaner'
require_relative '../app/app'


# require 'web_helpers'

Capybara.app = BookmarkManager

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.include Capybara::DSL
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
