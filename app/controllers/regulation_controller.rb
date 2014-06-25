class RegulationController < ApplicationController
  def view
   @regulation=Regulation.find 1
	 @title = "Regulation"

	 build_links
  end

  def edit
    @regulation=Regulation.find 1  

	 build_links	
  	
  end

  def update
    @regulation=Regulation.find 1
    if @regulation.update(bureaurucracy_params)
      flash_notice_edit "Regulation"
      redirect_to '/regulation'
    else
      
      render 'edit'
    
    end
    

	 build_links
  end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	@struct_links = Array.new
	@struct_links << {:name => "Ammission",:value => "/bureaucracy"}
	@struct_links << {:name => "Regulation",:value => "/regulation"}
	@struct_links << {:name => "Costs", :value => "/costs"}
	@struct_links << {:name => "Bursary", :value => "/bursary"}
  end
  def semantic_links
  end

  private
    def regulation_params
            params.require(:regulation).permit(:description) 
    end
end
