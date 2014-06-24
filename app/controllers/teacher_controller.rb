class TeacherController < ApplicationController
  def view
	t = Teacher.find(params[:id])
	@title = @name = t.firstname + " " + t.lastname
	@description = t.bio
	@photo = t.photo_url
	build_links
	build_courses
  end

  def curriculum
	t = Teacher.find(params[:id])
	@title = @name = t.firstname + " " + t.lastname
	@description = t.curriculum
	build_links
  end

 def new
@teacher=Teacher.new
end

def create
  @teacher=Teacher.new
  @teacher.firstname=params[:teacher][:firstname]
  @teacher.lastname=params[:teacher][:lastname]
  @teacher.bio=params[:teacher][:bio]
  @teacher.photo_url[:teacher][:photo_url]
  @teacher.curriculum[:teacher][:curriculum]
  if @teacher.save
    redirect_to teacher_path(@teacher)
  else
    render 'edit'
  end

end

def edit
@teacher = Teacher.find(params[:id])
end

def update
  @teacher=Teacher.find(params[:id])
  @teacher.firstname=params[:teacher][:firstname]
  @teacher.lastname=params[:teacher][:lastname]
  @teacher.bio=params[:teacher][:bio]
  @teacher.photo_url=params[:teacher][:bio]
  @teacher.curriculum[:teacher][:curriculum]
  if @teacher.save
    redirect_to teacher_path(@teacher)
  else
    render 'edit'
  end

end

def destroy
  @teacher=Teacher.find params[:id]
  @teacher.destroy

  redirect_to teacher_path

end


  def build_courses
	t = Teacher.find(params[:id])
	c = t.course
	@courses = Array.new
	c.each do |element|
		@courses << {:name => "#{element.name}",:url => "/course/#{element.id}/"}
	end
  end

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	t = Teacher.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Bio",:value => "/teacher/#{t.id}/"}
	@struct_links << {:name => "Curriculum",:value => "/teacher/#{t.id}/curriculum"}
  end
  def semantic_links
	t = Teacher.find(params[:id])
	@semant_links = Array.new
  end
end
