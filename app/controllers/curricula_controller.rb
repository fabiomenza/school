class CurriculaController < ApplicationController
  def view
	@title = "Curricula"
	@curricula =Curriculum.order('name ASC').all.paginate(page: params[:page])
	
  end
end
