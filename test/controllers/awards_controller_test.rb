require 'test_helper'

class AwardsControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
