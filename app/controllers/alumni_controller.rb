class AlumniController < ApplicationController
  def view
	@title = "Alumni"
	@alumni = Alumni.all
	build_links
  end




  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	@struct_links = Array.new
	@struct_links << {:name => "History",:value => "/history"}
	@struct_links << {:name => "Alumni",:value => "/alumni"}
  end
  def semantic_links
  end

end
