class CurriculaController < ApplicationController
	add_breadcrumb 'Curricula', :curricula_path
  def view
	@title = "Curricula"
	@curricula =Curriculum.order('name ASC').all.paginate(page: params[:page])
	

  end
end
