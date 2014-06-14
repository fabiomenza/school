class AwardController < ApplicationController
  def view
	a = Award.find(params[:id])
	@title = @name = a.title
	@description = a.description
  end

end
