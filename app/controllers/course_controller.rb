class CourseController < ApplicationController
  def view
	c = Course.find(params[:id])

	@title = @name = c.name
	@description = c.description
	build_links
  end

  def syllabus
	c = Course.find(params[:id])
	@title = @name = c.name
	@program = c.program
	build_links
  end

  def timetable
  	@course=Course.find(params[:id])
  	# indica le ore della mattina da cui partono le lezioni
  	start_hours=8
  	lectures=@course.lecture
  	time=Time.new().change(hour:start_hours,minute:0,second:0)
  	@rows=Array.new(11){ Array.new(6)}
  	 for i in 0..10
  	 	@rows[i][0]=time.advance(hours: i).hour
  	 end	

  	 # controlla il giorni di ongli lecture. 
  	 #E lo colloca nell'array a seconda del suo orario
  	 @weekday=['Monday','Tuesday','Wednesday','Thursday','Friday']
  	 lectures.each do |lecture| 
  	 	day=@weekday.find_index(lecture.w_day)+1 	

  	 	for i in lecture.start_time.hour...lecture.end_time.hour
  	 		# el=Array.new(2)
  	 		# el[0]=1
  	 		# el[1]=2
  	 		@rows[i-start_hours][day]={:name => lecture.classroom.name, :id =>lecture.classroom.id}
  	 	end

  	 end
  	
	build_links
  end


  
  def materials
	c = Course.find(params[:id])
	@name = @title = "Materials for " + c.name
	@materials = c.material.order('name ASC').paginate(page: params[:page])
	back_to_course
  end
  def exams
	c = Course.find(params[:id])
	@name = @title = "Exams for " + c.name
	@exams = Array.new
	c.exam.each do |exam|
		@exams << {:name => "#{exam.name}",:value => "/exam/#{exam.id}/"}
	end
	back_to_course
  end

  def curricula
	c = Course.find(params[:id])
	@name = @title = "Curricula related to " + c.name
	@curricula = c.curriculum.order('name ASC').paginate(page: params[:page])
	

	back_to_course

  end



  def courses_by_year
  	@year=params[:course][:year]
  	# @courses_by_year=Course.order('accademic_year DESC').all.paginate(page: params[:page])
  	date1=Date.new(@year.to_i)
  	date2=Date.new(@year.to_i+1)

  	@courses_by_year=Course.order('name ASC').where(accademic_year:  date1...date2).all.paginate(page: params[:page])
  	# quick and dirty
  	#@courses_by_year=Course.all.paginate(page: params[:page])


  	@courses=Array.new
	 #Informazioni mostrate: name, teacher, curriculum,year 
	@courses_by_year.each do |course|
		curricula=Array.new
		course.curriculum.each do |curriculum|
			curricula <<{:name => "#{curriculum.name}",
						 :id => curriculum.id

			}
		end
  		@courses << {:name => "#{course.name}",
  					 :id => course.id,
  					 :teacher => "#{course.teacher.firstname} #{course.teacher.lastname}",
  					 :teacher_id => course.teacher_id,
  					 :year => course.accademic_year,
  					 :curricula => curricula,
  					 :description => course.description



  					}
  	end

  end

  def courses_by_type
  	@curriculum_id=params[:curriculums][:type]
  	@curriculum=Curriculum.find(@curriculum_id)
  end


  def build_links
	structural_links
	semantic_links
  end
  def structural_links
	c = Course.find(params[:id])
	@struct_links = Array.new
	@struct_links << {:name => "Description",:value => "/course/#{c.id}/"}
	@struct_links << {:name => "Syllabus",:value => "/course/#{c.id}/syllabus"}
	@struct_links << {:name => "Timetable", :value => "/course/#{c.id}/timetable"}
  end
  def semantic_links
	c = Course.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{c.teacher.firstname} #{c.teacher.lastname}",:value => "/teacher/#{c.teacher_id}/"}
	@semant_links << {:name => "Materials",:value => "/course/#{c.id}/materials"}
	@semant_links << {:name => "Exams",:value => "/course/#{c.id}/exams"}
	@semant_links << {:name => "Classroom",:value => "/classroom/#{c.classroom_id}"}
	@semant_links << {:name => "Curricula",:value => "/course/#{c.id}/curricula"}
	@semant_links << {name: "News",value: "/course/#{c.id}/news"}
  end

  def back_to_course
  	c=Course.find(params[:id])
  	@semant_links=Array.new
	@semant_links << {name: c.name,value:"/course/#{c.id} "}
  end

end
