class MaterialController < ApplicationController

  def view
	m = Material.find(params[:id])
	@title = @name = m.name
	@description = m.description
	@multimedia = m.multimedia_url
	@lastmodified = m.updated_at
	build_links
  end



  def build_links
	structural_links
	semantic_links
  end
  def structural_links
  end
  def semantic_links
	m = Material.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{m.course.name}",:value => "/course/#{m.course.id}/"}
  end
end
