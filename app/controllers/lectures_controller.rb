class LecturesController < ApplicationController
	def new
		@lecture=Lecture.new
		@course=Course.find(params[:course_id])
		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		@classrooms=Classroom.select(:name, :id).order('name ASC')


		
		
	end
	def create
		lecture=Lecture.new
		set_params(lecture)

		if lecture.save
			flash_notice_create "Lecture"
			redirect_to course_lectures_path params[:course_id]
		else
			flash_error_create "Lecture"
			render 'new'
		end
		
	end

	def edit
		@lecture=Lecture.find(params[:id])
		@course=Course.find(params[:course_id])
		@weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
		@lecture_times=*(8..19)
		@classrooms=Classroom.select(:name, :id).order('name ASC')
		@start_hour=@lecture
		
	end

	def update
		lecture=Lecture.find(params[:id])
		set_params(lecture)
		if lecture.save
			flash_notice_update "Lecture"
			redirect_to course_lectures_path params[:course_id]
		else
			flash_error_update "Lecture"
			render 'edit'
		end

		
	end

	def index
		@lectures=Lecture.order('w_day ASC').order('start_time Asc')
		@course=Course.find params[:course_id]
		
	end

	def destroy
		@lecture=Lecture.find(params[:id])
		if @lecture.destroy
			flash_notice_destroy "Lecture"
		else
			flash_error_destroy "Lecture"
		end
		redirect_to course_lectures_path params[:course_id]
	end

	private
		def set_params (lecture)
			param=params[:lecture]
			lecture.w_day=param[:w_day]
			lecture.start_time=Time.zone.now.change( hour: param[:start_time] )
			lecture.end_time=Time.zone.now.change(hour: param[:end_time])
			lecture.course_id=params[:course_id]
			lecture.classroom_id=param[:classroom_id]
			
		end
end
