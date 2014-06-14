require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get reference" do
    get :reference
    assert_response :success
  end

end
