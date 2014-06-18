class CurriculumController < ApplicationController
  def view
	c = Curriculum.find(params[:id])
	@title = @name = c.name
	@description = c.description
	
	@courses = c.course
	

	build_links
  end

  def new
  	@curriculum=Curriculum.new
  	
  end

  def create
  	@curriculum=Curriculum.new(curriculum_params)

  	if @curriculum.save
  		redirect_to curriculum_id_path(@curriculum)
  	else
  		render 'new'
  	end
  	
  end

  def edit
		@curriculum =Curriculum.find(params[:id])
	
  end

  def index

  	 @curriculums=Curriculum.order('name ASC').all.paginate(page: params[:page])
  	
  end

  def destroy
    @curriculum=Curriculum.find(params[:id])
    @curriculum.destroy

    redirect_to curriulum_index_path
    
  end

  def update
    curriculum=Curriculum.find(params[:id])
      if curriculum.update(curriculum_params)
        redirect_to curriculum_id_path(curriculum)
      else
        render 'edit'
      end
    
  end

  def work_opportunity
	c = Curriculum.find(params[:id])
	@title = @name = "Work opportunities with " + c.name + " curriculum"
	@description = c.work_opportunity
	build_links
  end




  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Curriculum.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/curriculum/#{c.id}/"}
	@struct_links << {:name => "Work opportunities",:value => "/curriculum/#{c.id}/work_opportunity"}
  end
  def semantic_links
	c = Curriculum.find(params[:id])
	@semant_links = Array.new
  end
end

 private
    def curriculum_params
        params.require(:curriculum).permit(:name, :description, :work_opportunity)
    end

