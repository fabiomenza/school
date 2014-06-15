class CurriculaController < ApplicationController
  def view
	@title = "Curricula"
	@curricula = Array.new
	Curriculum.all.each do |curriculum|
		@curricula << {:name => "#{curriculum.name}",:value => "/curriculum/#{curriculum.id}/"}
	end
  end
end
