class HomeController < ApplicationController
  
  before_action :authenticate_admin!, except: [:index ]
  def index
    @title='HomePage'
  	@home=Home.find 1	
  end

  def edit
    @home=Home.find 1	
    add_breadcrumb 'Edit', edit_home_path
  end

  def update
    @home=Home.find 1
    if @home.update(home_params)
    
      flash_notice_edit "HomePage"
      redirect_to root_path
    else

      render 'edit'
    end 
  end

  private
    def home_params
      params.require(:home).permit(:description)
    end
end
