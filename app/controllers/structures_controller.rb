class StructuresController < ApplicationController
  def view
	@name = @title = "All structures"
	@structures = Array.new
	Structure.all.each do |structure|
		@structures << {:name => "#{structure.name}",:value => "/structure/#{structure.id}/"}
	end
  end
end
