require 'test_helper'

class CourseControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get syllabus" do
    get :syllabus
    assert_response :success
  end

  test "should get timetable" do
    get :timetable
    assert_response :success
  end

end
