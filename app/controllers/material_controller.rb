class MaterialController < ApplicationController

  def view
	m = Material.find(params[:id])
	@title = @name = m.name
	@description = m.description
	@multimedia = m.multimedia_url
	@lastmodified = m.updated_at
	build_links
  end

  def index
  	@materials=Material.where(course_id: params[:course_id] )
  	@course=Course.find params[:course_id]
    
  	
  end

  def new
  	@material=Material.new
  end

  def create
  	@material=Material.new(material_params)
  	@material.course_id=params[:course_id]

  	if @material.save
  		flash_notice_create "Material"
  		redirect_to course_material_index_path
  	else
  		# flash_error_create "Material"
  		render 'new'
  	end

  	
  end

  def edit
  	@material=Material.find params[:id]
  end

  def update
  	@material=Material.find params[:id]
  	if @material.update(material_params)
  		flash_notice_edit "Material"
  		redirect_to course_material_index_path
  	else
  		# flash_error_edit "Material"
  		render 'edit'
  	end
  end

  def destroy
  	material=Material.find params[:id]
  	if material.destroy
  		flash_notice_destroy "Material"
   	else
  		# flash_error_destroy "Material"
  	end

  	redirect_to course_material_index_path
  end



  def build_links
	structural_links
	semantic_links
  end

  def back_to_course
    @semant_links=Array.new
    @semant_links << {name: "Back to courses",value: course_index_path }

  end

  def structural_links
  end
  def semantic_links
	m = Material.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{m.course.name}",:value => "/course/#{m.course.id}/"}
  end


  private

  	def material_params
  		params.require(:material).permit(:name,:description, :multimedia_url)
  		
  	end
end
