class CoursesController < ApplicationController
  def view
	@name = @title = "All courses"
	@courses = Array.new
	Course.all.each do |course|
		@courses << {:name => "#{course.name}",:value => "/course/#{course.id}/"}
	end
  end
end
