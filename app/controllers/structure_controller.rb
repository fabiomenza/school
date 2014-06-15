class StructureController < ApplicationController
  def view
	c = Structure.find(params[:id])
	@title = @name = c.name
	@description = c.description
	build_links
  end

  def map
	c = Structure.find(params[:id])
	@title = @name = c.name
	@map = c.map
	build_links
  end

  def photogallery
	c = Structure.find(params[:id])
	@title = @name = c.name
	# TODO load photo's urls
	build_links
  end



  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	s = Structure.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/structure/#{s.id}/"}
	@struct_links << {:name => "Map",:value => "/structure/#{s.id}/map"}
	@struct_links << {:name => "Photogallery", :value => "/structure/#{s.id}/photogallery"}
  end
  def semantic_links
	s = Structure.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "Events hosted",:value => "#"}
	@semant_links << {:name => "Services available",:value => "#"}
  end
end
