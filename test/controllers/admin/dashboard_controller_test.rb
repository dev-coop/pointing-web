require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase

  test "should login and show dashboard" do
    login_as_admin
    get :index
    assert_response :success
    assert_template :index
  end

  test "as a guest it should redirect to login" do
    get :index
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

end
