class CoursesController < ApplicationController
  def view
	@name = @title = "All courses"
	@courses=Course.order('name ASC').all.paginate(page: params[:page])
	@courses_year=Course.order('accademic_year DESC').select('accademic_year').map{|item| item.accademic_year.year}.uniq
	@curriculum=Curriculum.order('name ASC').select('id, name')


  end
end
