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
	build_links
  end
  
  def materials
	c = Course.find(params[:id])
	@name = @title = "Materials for " + c.name
	@materials = Array.new
	c.material.each do |mat|
		@materials << {:name => "#{mat.name}",:value => "/material/#{mat.id}/"}
	end
	build_links
  end
  def exams
	c = Course.find(params[:id])
	@name = @title = "Exams for " + c.name
	@exams = Array.new
	c.exam.each do |exam|
		@exams << {:name => "#{exam.name}",:value => "/exam/#{exam.id}/"}
	end
	build_links
  end
  def curricula
	c = Course.find(params[:id])
	@name = @title = "Curricula related to " + c.name
	@curricula = Array.new
	c.curriculum.each do |curriculum|
		@curricula << {:name => "#{curriculum.name}",:value => "/curriculum/#{curriculum.id}/"}
	end
	build_links
  end

  def courses_by_year
  	courses_by_year=Course.order('accademic_year DESC').all;
  	@courses=Array.new
	 #Informazioni mostrate: name, teacher, culliculum,year 
	courses_by_year.each do |course|
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
  					 :curricula => curricula



  					}
  	end

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
  end

end
