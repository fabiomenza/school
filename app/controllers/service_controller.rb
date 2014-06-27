class ServiceController < ApplicationController
  
  before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]
  add_breadcrumb 'Services', :services_path
  add_breadcrumb "Index for services", :service_index_path, only: [:index, :new, :edit]

  def view
	s = Service.find(params[:id])
	@title = @name = s.name
	@description = s.description
  	add_breadcrumb s.name, service_path( s)
	build_links
  end

  def reference
	s = Service.find(params[:id])
	@title = @name = "Reference for " + s.name
	@description = s.reference
  	add_breadcrumb s.name, service_path( s)
	build_links
  end




  def new
	@service=Service.new
  add_breadcrumb 'New', new_service_path
  end

  def create
    @service=Service.new
    @service.name=params[:service][:name]
    @service.description=params[:service][:description]
    @service.reference=params[:service][:reference]
    @service.structure_id=params[:structure]
    @service.classroom_id=params[:classroom]
    @service.service_type_id=params[:service_type]
    if @service.save
      redirect_to service_path(@service)
    else
      render 'edit'
    end
    
  end

  def edit
	@service = Service.find(params[:id])
  add_breadcrumb 'Edit', edit_service_path(@service)
  end

  def update
    @service=Service.find(params[:id])
    @service.name=params[:service][:name]
    @service.description=params[:service][:description]
    @service.reference=params[:service][:reference]
    @service.structure_id=params[:structure]
    @service.classroom_id=params[:classroom]
    @service.service_type_id=params[:service_type]
    if @service.save
      redirect_to service_path(@service)
    else
      render 'edit'
    end
    
  end

  def destroy
    @service=Service.find params[:id]
    @service.destroy

    redirect_to services
    
  end



  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	s = Service.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/service/#{s.id}/"}
	@struct_links << {:name => "Reference",:value => "/service/#{s.id}/reference"}
  end
  def semantic_links
	c = Service.find(params[:id])
	@semant_links = Array.new
	if c.structure
		@semant_links << {:name => "#{c.structure.name}",:value => "/structure/#{c.structure.id}/"}
	end
	if c.classroom
		@semant_links << {:name => "Room #{c.classroom.name}",:value => "/classroom/#{c.classroom.id}/"}
	end
  end


  def index
    @services=Service.order('name ASC').paginate(page: params[:page])

    
  end
end
