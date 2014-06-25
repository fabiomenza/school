class RegulationController < ApplicationController
  add_breadcrumb 'Bureaucracy', :bureaucracy_path
  add_breadcrumb 'Regulation', :regulation_path

  def view
  	@regulation=Regulation.find 1
	@title = "Regulation"

	build_links
  end

  def edit
    @regulation=Regulation.find 1	
    add_breadcrumb 'edit', edit_regulation_path
  	
  end

  def update
    @regulation=Regulation.find 1
    if @regulation.update(regulation_params)
    	
      flash_notice_edit "Regulation"
      redirect_to regulation_path
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
  	@struct_links << {name: "Ammission",value: bureaucracy_path}
  	@struct_links << {name: "Regulation",value: regulation_path}
  	@struct_links << {name: "Costs", value: costs_path}
  	@struct_links << {name: "Bursary", value: bursary_path}
  end
  
  def semantic_links
  end


  private
    def regulation_params
            params.require(:regulation).permit(:description) 
    end
end
