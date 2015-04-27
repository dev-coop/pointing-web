require "#{File.dirname(__FILE__)}/../test_helper"

class LoginTest < ActionDispatch::IntegrationTest

  def setup
    # represents normal app login entry point actually used
    @login_start = "/auth/login"
    @login_start_template = "devise/sessions/new"
    @admin ||= create(:user, :admin)
  end

  # makes sure app start goes to login page
  def test_app_entry_route
    get "/"
    assert_response :redirect
    assert_redirected_to new_user_session_url
  end

  def test_admin_login
    user_goes_to_login
    user_submits_login user: { :email => @admin.email, :password => @admin.password }
    assert_redirected_to root_url
    follow_redirect!
    # the Dashboard page should have ul#nav, and an h1, etc.
    assert_select "ul#side-menu"
    assert_select "h1", {html: 'Dashboard'}
  end

  def test_bad_authentication
    user_goes_to_login
    user_submits_login user: { :email => @admin.email, :password => 'B4dP4$$w0rd' }
    assert_response :success    

    # expect a nav list to be empty
    assert_select 'ul#side-menu>li', {count: 0}

    # expect a flash message to be present
    assert_select "div.alert", {text: /Invalid email or password/}

  end

  private
  
    # entry point of login page at which user enters username and password
    def user_goes_to_login
      get @login_start
      assert_response :success
      assert_template @login_start_template
    end
    
    # submits username and password to login page
    def user_submits_login(options)
      post @login_start, options
    end

end