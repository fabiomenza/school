class HowToGetThereController < ApplicationController
  add_breadcrumb 'How to get there', :how_to_get_there_path

  before_action :authenticate_admin!, except: [:view ]

  def view
	  @title = "How to get there - Map"
    @how_to_get_there=HowToGetThere.find 1
  end

  def edit
    @how_to_get_there=HowToGetThere.find 1  
    add_breadcrumb 'Edit', edit_how_to_get_there_path
  end

  def update
    @how_to_get_there=HowToGetThere.find 1
    if @how_to_get_there.update(how_params)
      flash_notice_edit "How to get there"
      redirect_to how_to_get_there_path
    else
      
      render 'edit'
    end
  end

  private
    def how_params
            params.require(:how_to_get_there).permit(:description) 
    end


end
