ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'active_support/testing/assertions'
include ActiveSupport::Testing::Assertions

module Minitest
  module Reporters
    class AwesomeReporter < DefaultReporter
      GREEN = '0;32'
      RED = '0;31'

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end
    end
  end
end

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
    # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end
end
