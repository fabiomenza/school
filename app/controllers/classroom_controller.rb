class ClassroomController < ApplicationController
  def view
	c = Classroom.find(params[:id])
	@title = @name = "Room " + c.name
	@description = c.description
	build_links
  end

  def how_to_get_there
	c = Classroom.find(params[:id])
	@title = @name = "How to reach " + c.name
	@description = c.how_to_get_there
	build_links
  end

  def availability
	c = Classroom.find(params[:id])
	@title = @name = "Room " + c.name
	build_links
  end





  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Classroom.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/classroom/#{c.id}/"}
	@struct_links << {:name => "How to reach",:value => "/classroom/#{c.id}/how_to_get_there"}
	@struct_links << {:name => "Availability",:value => "/classroom/#{c.id}/availability"}
  end
  def semantic_links
	c = Classroom.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "Courses hosted",:value => "#"}
	@semant_links << {:name => "Exams hosted",:value => "#"}
	@semant_links << {:name => "Services available",:value => "#"}
  end
end
