class ExamController < ApplicationController
  def view
	e = Exam.find(params[:id])
	@title = @name = e.name
	@description = e.description
	@time = e.time.to_s(:long)
	build_links
  end



  def build_links
	structural_links
	semantic_links
  end
  def structural_links
  end
  def semantic_links
	e = Exam.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{e.course.name}",:value => "/course/#{e.course.id}/"}
	@semant_links << {:name => "Room #{e.classroom.name}",:value => "/classroom/#{e.classroom.id}/"}
  end
end
