require 'test_helper'

class TeacherControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get curriculum" do
    get :curriculum
    assert_response :success
  end

end
