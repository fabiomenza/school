class BureaucracyController < ApplicationController
  add_breadcrumb 'Bureaucracy', :bureaucracy_path
  add_breadcrumb 'Ammission', :bureaucracy_path

  def view
   @bureaucracy=Bureaucracy.find 1
	 @title = "Ammission"


	 build_links
  end

  def edit
    @bureaucracy=Bureaucracy.find 1  	
  	 add_breadcrumb 'edit', edit_bureaucracy_path
  end

  def update
    @bureaucracy=Bureaucracy.find 1
    if @bureaucracy.update(bureaurucracy_params)
      flash_notice_edit "Bureaucracy"
      redirect_to '/bureaucracy'
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
	@struct_links << {:name => "Ammission",:value => "/bureaucracy"}
	@struct_links << {:name => "Regulation",:value => "/regulation"}
	@struct_links << {:name => "Costs", :value => "/costs"}
	@struct_links << {:name => "Bursary", :value => "/bursary"}
  end
  def semantic_links
  end


  private
    def bureaurucracy_params
            params.require(:bureaucracy).permit(:description) 
    end
end
