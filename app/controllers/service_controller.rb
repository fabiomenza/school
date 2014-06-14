class ServiceController < ApplicationController
  def view
	s = Service.find(params[:id])
	@title = @name = s.name
	@description = s.description
	build_links
  end

  def reference
	s = Service.find(params[:id])
	@title = @name = "Reference for " + s.name
	@description = s.description
	build_links
  end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	s = Service.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/service/#{s.id}/"}
	@struct_links << {:name => "Reference",:value => "/service/#{s.id}/reference"}
  end
  def semantic_links
	c = Service.find(params[:id])
	@semant_links = Array.new
	if c.structure
		@semant_links << {:name => "#{c.structure.name}",:value => "/structure/#{c.structure.id}/"}
	end
	if c.classroom
		@semant_links << {:name => "Room #{c.classroom.name}",:value => "/classroom/#{c.classroom.id}/"}
	end
  end
end
