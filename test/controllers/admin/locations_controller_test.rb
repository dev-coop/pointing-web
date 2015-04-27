require 'test_helper'

class Admin::LocationsControllerTest < ActionController::TestCase
  setup do
    login_as_admin
    @location = create :location
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address: @location.address, comments: @location.comments, description: @location.description, last_geocoded_at: @location.last_geocoded_at, lat: @location.lat, lng: @location.lng, name: @location.name, status: @location.status }
    end

    assert_redirected_to admin_location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { address: @location.address, comments: @location.comments, description: @location.description, last_geocoded_at: @location.last_geocoded_at, lat: @location.lat, lng: @location.lng, name: @location.name, status: @location.status }
    assert_redirected_to admin_location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to admin_locations_path
  end
end
