class LecturesController < ApplicationController

	add_breadcrumb 'Courses', :courses_path
	add_breadcrumb "Index for courses", :course_index_path, only: [:index, :new, :edit]
  	add_breadcrumb "Index for lectures", :course_lectures_index_path, only: [:index, :new, :edit]

  	before_action :authenticate_admin!

	def new
		@lecture=Lecture.new
		@course=Course.find(params[:course_id])
		@classroom=Classroom.find (@course.classroom_id)
		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		
		add_breadcrumb "New lecture", new_course_lecture_path(@course)
	end

	def create
		@lecture=Lecture.new
		@course=Course.find params[:course_id]
		@classroom=Classroom.find (@course.classroom_id)

		set_params(@lecture)

		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		@classrooms=Classroom.select(:name, :id).order('name ASC')

		if @lecture.save
			flash_notice_create "Lecture"
			redirect_to course_lectures_index_path params[:course_id]
		else
			#flash_error_create "Lecture"
			render 'new'
		end
	end

	def edit
		@lecture=Lecture.find(params[:id])
		@course=Course.find(params[:course_id])
		@classroom=Classroom.find (@course.classroom_id)
		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		@classrooms=Classroom.select(:name, :id).order('name ASC')
		@start_hour=@lecture

		add_breadcrumb "#{@lecture.w_day}: from #{@lecture.start_time.strftime("%R")} to #{@lecture.end_time.strftime("%R")}", new_course_lecture_path(@course)
	end

	def update
		@lecture=Lecture.find(params[:id])
		@course=Course.find(params[:course_id])
		@classroom=Classroom.find (@course.classroom_id)
		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		@classrooms=Classroom.select(:name, :id).order('name ASC')
		@start_hour=@lecture
		
		
		set_params(@lecture)
		if @lecture.save
			flash_notice_edit "Lecture"
			redirect_to course_lectures_index_path params[:course_id]
		else
			# flash_error_update "Lecture"
			render 'edit'
		end		
	end

	def index
		@lectures=Lecture.order('w_day ASC').order('start_time Asc').where(course_id: params[:course_id] )
		@course=Course.find params[:course_id]		
	end

	def destroy
		@lecture=Lecture.find(params[:id])
		if @lecture.destroy
			flash_notice_destroy "Lecture"
		else
			#flash_error_destroy "Lecture"
		end
		redirect_to course_lectures_index_path params[:course_id]
	end

	private
		def set_params (lecture)
			param=params[:lecture]
			lecture.w_day=param[:w_day]
			lecture.start_time=Time.zone.now.change( hour: param[:start_time] )
			lecture.end_time=Time.zone.now.change(hour: param[:end_time])
			lecture.course_id=params[:course_id]
				
		end
end
