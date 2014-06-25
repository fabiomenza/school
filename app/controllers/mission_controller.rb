class MissionController < ApplicationController
  def view
	@mission=Mission.find 1
	@title = "Mission"
  end

  def edit
    @mission=Mission.find 1  	
  	
  end

  def update
    @mission=Mission.find 1
    if @mission.update(bureaurucracy_params)
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
