class ClassroomController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]


  def view
	c = Classroom.find(params[:id])
	@title = @name = "Room " + c.name
	@description = c.description
	build_links
  end

  def how_to_get_there
	c = Classroom.find(params[:id])
	@title = @name = "How to reach " + c.name
	@description = c.how_to_get_there
	build_links
  end

  def availability
	c = Classroom.find(params[:id])
	@title = @name = "Room " + c.name
	build_links
  end

  def services
  	@classroom=Classroom.find params[:id]
  	@services=@classroom.service

  end

  def exams
    @classroom=Classroom.find params[:id]
    @exams=@classroom.exam
  end

  def courses
    @classroom=Classroom.find params[:id]
    @courses=@classroom.course
  end


def new
@classroom=Classroom.new
end

def create
 @classroom=Classroom.new
 @classroom.name=params[:classroom][:name]
 @classroom.description=params[:classroom][:description]
 @classroom.how_to_get_there=params[:classroom][:how_to_get_there]
 if @classroom.save
   redirect_to classroom_path(@classroom)
 else
   render 'edit'
 end

end

def edit
@classroom = Classroom.find(params[:id])
end

def update
 @classroom=Classroom.find(params[:id])
 @classroom.name=params[:classroom][:name]
 @classroom.description=params[:classroom][:description]
 @classroom.how_to_get_there=params[:classroom][:how_to_get_there]
 if @classroom.save
   redirect_to classroom_path(@classroom)
 else
   render 'edit'
 end

end

def destroy
 @classroom=Classroom.find params[:id]
 @classroom.destroy

 redirect_to classroom_path

end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Classroom.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/classroom/#{c.id}/"}
	@struct_links << {:name => "How to reach",:value => "/classroom/#{c.id}/how_to_get_there"}
	@struct_links << {:name => "Availability",:value => "/classroom/#{c.id}/availability"}
  end
  def semantic_links
	c = Classroom.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "Courses hosted",:value => "/classroom/#{c.id}/courses"}
	@semant_links << {:name => "Exams hosted",:value => "/classroom/#{c.id}/exams"}
	@semant_links << {:name => "Services available",:value => "/classroom/#{c.id}/services"}
  end
end
