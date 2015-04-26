ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'  # Uncomment for awesome colorful output
require 'minitest/autorun'
require 'capybara/rails'

class ActiveSupport::TestCase
  # JR 2015-04-25 Let's use factories (with Factory_Girl) instead of fixtures
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  include FactoryGirl::Syntax::Methods
 
end

class ActionController::TestCase
  include Devise::TestHelpers

  def login_as_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = FactoryGirl.create(:user, :admin)
    sign_in admin
  end
end