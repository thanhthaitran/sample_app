ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    fixtures :all

    def is_logged_in?
      !session[:user_id].nil?
    end

    def log_in_as user
      session[:user_id] = user.id
    end
  end
end

module ActionDispatch
  class IntegrationTest
    def log_in_as user, password: "password", remember_me: "1"
      post login_path, params: {session: {email: user.email, password: password, remember_me: remember_me}}
    end
  end
end
