class CoursesController < ApplicationController
	
  def view
  	add_breadcrumb "Courses", courses_path

	@courses=Course.order('name ASC').all.paginate(page: params[:page])
	@courses_year=Course.order('accademic_year DESC').select('accademic_year').map{|item| item.accademic_year.year}.uniq
	@curriculum=Curriculum.order('name ASC').select('id, name')


  end
end
