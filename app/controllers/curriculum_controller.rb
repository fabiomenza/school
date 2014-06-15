class CurriculumController < ApplicationController
  def view
	c = Curriculum.find(params[:id])
	@title = @name = c.name
	@description = c.description
	
	@courses = Array.new
	c.course.each do |course|
		@courses << {:name => "#{course.name}",:value => "/course/#{course.id}/"}
	end

	build_links
  end

  def work_opportunity
	c = Curriculum.find(params[:id])
	@title = @name = "Work opportunities with " + c.name + " curriculum"
	@description = c.work_opportunity
	build_links
  end




  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Curriculum.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/curriculum/#{c.id}/"}
	@struct_links << {:name => "Work opportunities",:value => "/curriculum/#{c.id}/work_opportunity"}
  end
  def semantic_links
	c = Curriculum.find(params[:id])
	@semant_links = Array.new
  end
end
