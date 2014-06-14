require 'test_helper'

class ClassroomControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get how_to_get_there" do
    get :how_to_get_there
    assert_response :success
  end

  test "should get availability" do
    get :availability
    assert_response :success
  end

end
