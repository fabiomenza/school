class CoursesController < ApplicationController
  def view
	@name = @title = "All courses"
	@courses=Course.all
	
  end
end
