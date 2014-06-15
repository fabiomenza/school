class EventController < ApplicationController
  def view
	e = Event.find(params[:id])
	@title = @name = e.name
	@description = e.description
	@time = e.time
	build_links
  end
  def get_involved
	e = Event.find(params[:id])
	@title = @name = e.name
	@description = e.get_involved
	build_links
  end



  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	e = Event.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/event/#{e.id}/"}
	@struct_links << {:name => "Get involved",:value => "/event/#{e.id}/get_involved"}
  end
  def semantic_links
	e = Event.find(params[:id])
	@semant_links = Array.new
	if e.structure
		@semant_links << {:name => "Hosted at #{e.structure.name}",:value => "/structure/#{e.structure.id}"}
	end
  end
end
