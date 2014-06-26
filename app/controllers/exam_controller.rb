class ExamController < ApplicationController
  
before_action :authenticate_admin!, only: [:index, :new, :create, :destroy, :edit,:update]
  

  def view
	e = Exam.find(params[:id])
	@title = @name = e.name
	@description = e.description
	@time = e.time.to_s(:long)
	build_links
  end

def new
@exam=Exam.new
end

def create
 @exam=Exam.new
 @exam.name=params[:teacher][:name]
 @exam.description=params[:teacher][:description]
 @exam.time=params[:teacher][:time]
 @exam.course_id=params[:teacher][:course_id]
 @exam.classroom_id=params[:teacher][:classroom_id]
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
@exam.name=params[:teacher][:name]
@exam.description=params[:teacher][:description]
@exam.time=params[:teacher][:time]
@exam.course_id=params[:teacher][:course_id]
@exam.classroom_id=params[:teacher][:classroom_id]
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
