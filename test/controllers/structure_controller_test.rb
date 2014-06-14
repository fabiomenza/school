require 'test_helper'

class StructureControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get map" do
    get :map
    assert_response :success
  end

  test "should get photogallery" do
    get :photogallery
    assert_response :success
  end

end
