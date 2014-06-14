class CourseController < ApplicationController
  def view
	c = Course.find(params[:id])
	@title = @name = c.name
	@description = c.description
	build_links
  end

  def syllabus
	c = Course.find(params[:id])
	@title = @name = c.name
	@program = c.program
	build_links
  end

  def timetable
	build_links
  end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Course.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Descrizione",:value => "/course/#{c.id}/"}
	@struct_links << {:name => "Syllabus",:value => "/course/#{c.id}/syllabus"}
	@struct_links << {:name => "Timetable", :value => "/course/#{c.id}/timetable"}
  end
  def semantic_links
	c = Course.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{c.teacher.firstname} #{c.teacher.lastname}",:value => "/teacher/#{c.teacher_id}/"}
	@semant_links << {:name => "Materials",:value => "#"}
	@semant_links << {:name => "Exams",:value => "#"}
	@semant_links << {:name => "Classroom",:value => "/classroom/#{c.classroom_id}"}
	@semant_links << {:name => "Curricula",:value => "#"}
  end
end
