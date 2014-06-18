class StructuresController < ApplicationController
  def view
	@types = Array.new
	StructureType.all.each do |type|
		@types << {:name => "#{type.name}",:value => "/structures/type/#{type.id}/"}
	end

	@name = @title = "All structures"
	@structures = Array.new
	Structure.all.each do |structure|
		@structures << {:name => "#{structure.name}",:value => "/structure/#{structure.id}/"}
	end
  end

  def type
	type = StructureType.find(params[:id])
	@structures = Array.new
	@name = @title = type.name + " structures"
	type.structure.each do |structure|
		@structures << {:name => "#{structure.name}",:value => "/structure/#{structure.id}/"}
	end
  end
end
