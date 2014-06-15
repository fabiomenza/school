class CostsController < ApplicationController
  def view
	@title = "Costs"
	build_links
  end




  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	@struct_links = Array.new
	@struct_links << {:name => "Ammission",:value => "/bureaucracy"}
	@struct_links << {:name => "Regulation",:value => "/regulation"}
	@struct_links << {:name => "Costs", :value => "/costs"}
	@struct_links << {:name => "Bursary", :value => "/bursary"}
  end
  def semantic_links
  end
end
