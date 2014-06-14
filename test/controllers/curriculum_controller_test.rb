require 'test_helper'

class CurriculumControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get work_opportunity" do
    get :work_opportunity
    assert_response :success
  end

end
