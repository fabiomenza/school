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
			redirect_to course_timetable_path(params[:course_id])
		else
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
			redirect_to course_timetable_path(params[:course_id])
		else
			render 'edit'
		end

		
	end

	def index
		@lectures=Lecture.order('w_day ASC').order('start_time Asc')
		@couse=Lecture
		
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
