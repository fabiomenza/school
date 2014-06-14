require 'test_helper'

class EventControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get get_involved" do
    get :get_involved
    assert_response :success
  end

end
