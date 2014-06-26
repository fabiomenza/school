class BursaryController < ApplicationController

  add_breadcrumb 'Bureaucracy', :bureaucracy_path
  add_breadcrumb 'Bursary', :bursary_path

  before_action :authenticate_admin!, except: [:view ]

  def view
   
   @bursary=Bursary.find 1
   build_links
  end

  def edit
    @bursary=Bursary.find 1	
    add_breadcrumb 'Edit', bursary_path
  end

  def update
    @bursary=Bursary.find 1
    if @bursary.update(bursary_params)
    
      flash_notice_edit "bursary"
      redirect_to bursary_path
    else

      render 'edit'
    end  
  end



  def build_links
    structural_links
  end
  
  def structural_links
    @struct_links = Array.new
    @struct_links << {name: "Ammission",value: bureaucracy_path}
    @struct_links << {name: "Regulation",value: regulation_path}
    @struct_links << {name: "Costs", value: costs_path}
    @struct_links << {name: "Bursary", value: bursary_path}
  end
 
  private
    def bursary_params
            params.require(:bursary).permit(:description)
    end
end