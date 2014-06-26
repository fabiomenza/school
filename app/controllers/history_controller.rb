class HistoryController < ApplicationController
  add_breadcrumb 'History', :history_path

  before_action :authenticate_admin!, except: [:view ]
  
  def view
   @history=History.find 1
	 @title = "History"


	 build_links
  end

  def edit
    @history=History.find 1  	
    add_breadcrumb 'Edit', edit_history_path
  	
  end

  def update
    @history=History.find 1
    if @history.update(history_params)
      flash_notice_edit "History"
      redirect_to '/history'
    else
      
      render 'edit'
    
    end
    
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


  private
    def history_params
            params.require(:history).permit(:description) 
    end
end
