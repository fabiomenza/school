class CourseController < ApplicationController
  def view
	c = Course.find(params[:id])
	@title = @name = c.name
	@description = c.description
	@program = c.program
  end

  def syllabus
  end

  def timetable
  end
end
