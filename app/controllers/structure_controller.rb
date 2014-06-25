class StructureController < ApplicationController
  def view
	c = Structure.find(params[:id])
	@title = @name = c.name
	@description = c.description
  	add_breadcrumb c.name, structure_path(c)
	build_links
  end

  def map
	c = Structure.find(params[:id])
	@title = @name = c.name
	@map = c.map
        c.map = @map
  	add_breadcrumb c.name, structure_path(c)
	build_links
  end

  def photogallery
	c = Structure.find(params[:id])
	@title = @name = c.name
	@photos = Array.new
	c.photo.each do |photo|
		@photos << {:name => "#{photo.name}",:value => "#{photo.url}"}
	end
  	add_breadcrumb c.name, structure_path(c)

	build_links
  end
  def events
	c = Structure.find(params[:id])
	@title = @name = "Events that take place in " + c.name
	@events = Array.new
	c.event.each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}"}
	end

	build_links
  end
  def services
	c = Structure.find(params[:id])
	@title = @name = "Services available at " + c.name
	@services = Array.new
	c.service.each do |service|
		@services << {:name => "#{service.name}",:value => "/service/#{service.id}"}
	end

	build_links
  end

  def new
	@structure=Structure.new
  end

  def create
    @structure=Structure.new
    @structure.name=params[:structure][:name]
    @structure.description=params[:structure][:description]
    @structure.map=params[:structure][:map]
    @structure.structure_type_id=params[:structure_type]
    if @structure.save
      redirect_to structure_path(@structure)
    else
      render 'edit'
    end
    
  end

  def edit
	@structure = Structure.find(params[:id])
  end

  def update
    @structure=Structure.find(params[:id])
    @structure.name=params[:structure][:name]
    @structure.description=params[:structure][:description]
    @structure.map=params[:structure][:map]
    @structure.structure_type_id=params[:structure_type]
    if @structure.save
      redirect_to structure_path(@structure)
    else
      render 'edit'
    end
    
  end

  def destroy
    @structure=Structure.find params[:id]
    @structure.destroy

    redirect_to structures
    
  end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	s = Structure.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/structure/#{s.id}/"}
	@struct_links << {:name => "Map",:value => "/structure/#{s.id}/map"}
	@struct_links << {:name => "Photogallery", :value => "/structure/#{s.id}/photogallery"}
  end
  def semantic_links
	s = Structure.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "Events hosted",:value => "/structure/#{s.id}/events"}
	@semant_links << {:name => "Services available",:value => "/structure/#{s.id}/services"}
  end
end
