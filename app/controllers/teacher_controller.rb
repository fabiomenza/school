class TeacherController < ApplicationController
  def view
	t = Teacher.find(params[:id])
	@title = @name = t.firstname + " " + t.lastname
	@description = t.bio
	@photo = t.photo_url
	build_links
	build_courses
  end

  def curriculum
	t = Teacher.find(params[:id])
	@title = @name = t.firstname + " " + t.lastname
	@description = t.curriculum
	build_links
  end

 


  def build_courses
	t = Teacher.find(params[:id])
	c = t.course
	@courses = Array.new
	c.each do |element| 
		@courses << {:name => "#{element.name}",:url => "/course/#{element.id}/"}
	end 
  end

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	t = Teacher.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Bio",:value => "/teacher/#{t.id}/"}
	@struct_links << {:name => "Curriculum",:value => "/teacher/#{t.id}/curriculum"}
  end
  def semantic_links
	t = Teacher.find(params[:id])
	@semant_links = Array.new
  end
end
