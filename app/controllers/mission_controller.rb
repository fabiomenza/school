class MissionController < ApplicationController
  add_breadcrumb 'Mission', :mission_path

  def view
	@mission=Mission.find 1
	@title = "Mission"
  end

  def edit
    @mission=Mission.find 1  
    add_breadcrumb 'Edit', edit_mission_path	
  	
  end

  def update
    @mission=Mission.find 1
    if @mission.update(mission_params)
      flash_notice_edit "Mission"
      redirect_to '/mission'
    else
      
      render 'edit'
    
    end
    
  end

  private
    def mission_params
            params.require(:mission).permit(:description) 
    end
end
