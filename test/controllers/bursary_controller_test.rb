require 'test_helper'

class BursaryControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
