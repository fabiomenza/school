class ExamController < ApplicationController

before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]


  def view
	e = Exam.find(params[:id])
	@title = @name = e.name
	@description = e.description
	@time = e.time
	build_links
  end

def new
@exam=Exam.new
end

def create
 @exam=Exam.new
 @exam.name=params[:exam][:name]
 @exam.description=params[:exam][:description]
 @exam.time=params[:exam][:time]
 @exam.course_id=params[:exam][:course_id]
 @exam.classroom_id=params[:exam][:classroom_id]
 if @exam.save
   redirect_to exam_path(@exam)
 else
   render 'edit'
 end

end

def edit
@exam = Exam.find(params[:id])
end

def update
 @classroom=Classroom.find(params[:id])
@exam.name=params[:exam][:name]
@exam.description=params[:exam][:description]
@exam.time=params[:exam][:time]
@exam.course_id=params[:exam][:course_id]
@exam.classroom_id=params[:exam][:classroom_id]
 if @exam.save
   redirect_to exam_path(@exam)
 else
   render 'edit'
 end

end

def destroy
 @exam=Exam.find params[:id]
 @exam.destroy

 redirect_to exam_path

end

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
  end
  def semantic_links
	e = Exam.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{e.course.name}",:value => "/course/#{e.course.id}/"}
	@semant_links << {:name => "Room #{e.classroom.name}",:value => "/classroom/#{e.classroom.id}/"}
  end
end
