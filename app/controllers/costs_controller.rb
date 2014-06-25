class CostsController < ApplicationController
  add_breadcrumb 'Bureaucracy', :bureaucracy_path
  add_breadcrumb 'Costs', :cost_path


  def view
   @title = "Costs"
   @costs=Cost.find 1
   build_links
  end
  def edit
    @costs=Cost.find 1	
    add_breadcrumb 'Edit', edit_cost_path
  
  end

  def update
    @costs=Cost.find 1
    if @costs.update(costs_params)
    
      flash_notice_edit "costs"
      redirect_to cost_path
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
    def costs_params
            params.require(:cost).permit(:description)
    end
end