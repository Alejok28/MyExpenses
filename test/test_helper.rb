require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Add more helper methods to be used by all tests here...
end

# 
# class ActionDispatch::SystemTestCase
#   include Capybara::DSL
#   include Capybara::Minitest::Assertions
#
#   # Reset sessions and driver between tests
#   # Use super wherever this method is redefined in your individual test classes
#   def teardown
#     Capybara.reset_sessions!
#     # Capybara.use_default_driver
#     Capybara.default_driver = :selenium # :selenium_chrome and :selenium_chrome_headless are also registered
#
#   end
# end
