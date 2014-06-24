class CurriculumController < ApplicationController

  require 'will_paginate/array'

  def view
	c = Curriculum.find(params[:id])
	@title = @name = c.name
	@description = c.description
	
	@courses = c.course
	

	build_links
  end


  def manage_courses

    curriculum=Curriculum.find params[:curriculum_id]
    @name=curriculum.name
    if params[:search]
      @courses=curriculum.course.where('name LIKE ?', "%#{params[:search]}%")
    else
      @courses=curriculum.course
    end

    @courses=@courses.paginate(page: params[:page])   

  end

  def list_courses_to_add

    #TODO, magari rendere piu' snello
    @curriculum=Curriculum.find params[:curriculum_id]
    if params[:search]
      courses=Course.where('name LIKE ?', "%#{params[:search]}%")
    else
      courses=Course.all
    end
    @courses=Array.new
    courses.each do |course|
      unless @curriculum.course.exists? id: course.id
        @courses << course 
      end
    end
    @courses=@courses.paginate(page: params[:page])
   
    
    
  end


  def add_course
    curriculum=Curriculum.find params[:curriculum_id]
    course=Course.find params[:id]
    curriculum.course << course
    flash[:notice]="Course successfully added to the curriculum"
    redirect_to curriculum_courses_path
   
  end



 def remove_course
    curriculum=Curriculum.find(params[:curriculum_id])
    course=Course.find(params[:id])
    if curriculum.course.delete(course)
      flash[:notice]="Course successfully removed from the curriculum"
      redirect_to curriculum_courses_path
    else
      flash.now[:error]="Unable to remove the course from the curriculum"
      render 'manage_courses'
    end
  end

  def new
  	@curriculum=Curriculum.new
  	
  end

  def create
  	@curriculum=Curriculum.new(curriculum_params)

  	if @curriculum.save
      flash_notice_create "Curriculum"
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
  	 @semant_links = Array.new
     

  end

  def destroy
    @curriculum=Curriculum.find(params[:id])
    if @curriculum.destroy
      flash_notice_destroy "Curriculum"
    else
      #flash_error_destroy "Curriculum"
    end

    redirect_to curriulum_index_path
    
  end

  def update
    curriculum=Curriculum.find(params[:id])
      if curriculum.update(curriculum_params)
        flash_notice_edit "Curriculum"
        redirect_to curriculum_index_path
      else
        #flash_error_update "Curriculum"
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

