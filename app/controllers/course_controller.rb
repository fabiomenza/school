class CourseController < ApplicationController
  add_breadcrumb "Courses", :courses_path

  
def view
  @course= Course.find(params[:id])

  build_links

  add_breadcrumb @course.name, course_path( @course)
end

def syllabus
  c = Course.find(params[:id])
  @title = @name = c.name
  @program = c.program


   

  if params[:curriculum_id]
    gt_type_structural_links
    semantic_links

    add_breadcrumb "Courses for curriculum #{Curriculum.find(params[:curriculum_id]).name}", courses_type_guided_tour_id_path(params[:curriculum_id],c)
    add_breadcrumb 'Syllabus', courses_type_guided_tour_id_syllabus_path(params[:curriculum_id],c)
  elsif params[:courses_year]
    gt_year_structural_links
    semantic_links

    add_breadcrumb "Course in the year #{params[:courses_year]}", courses_year_guided_tour_id_path(params[:courses_year],c)
    add_breadcrumb 'Syllabus', courses_year_guided_tour_id_syllabus_path(params[:courses_year],c)
      
  else
    build_links

    add_breadcrumb c.name, course_path(c)
    add_breadcrumb 'Syllabus', course_syllabus_path(c)
  end
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
      @rows[i-start_hours][day]={:name => lecture.classroom.name, :id =>lecture.classroom.id}
    end

  end

  if params[:curriculum_id]

    gt_type_structural_links
    semantic_links

    add_breadcrumb "Courses for curriculum #{Curriculum.find(params[:curriculum_id]).name}", courses_type_guided_tour_id_path(params[:curriculum_id],@course)
    add_breadcrumb 'Timetable', courses_type_guided_tour_id_timetable_path(params[:curriculum_id],@course)
  
  elsif params[:courses_year]

    gt_year_structural_links
    semantic_links

    add_breadcrumb "Course in the year #{params[:courses_year]}", courses_year_guided_tour_id_path(params[:courses_year],@course)
    add_breadcrumb 'Timetable', courses_year_guided_tour_id_timetable_path(params[:courses_year],@course)
  
  else
    build_links

    add_breadcrumb @course.name, course_path(@course)
    add_breadcrumb 'Timetable', course_timetable_path(@course)
  
  end

    
  end
  
def materials
  c = Course.find(params[:id])
  @name = @title = "Materials for " + c.name
  @materials = c.material.order('name ASC').paginate(page: params[:page])
  back_to_course

  add_breadcrumb c.name, course_path(c)
  add_breadcrumb 'Materials', course_materials_path(c)
end

def exams
   c = Course.find(params[:id])
   @name = @title = "Exams for " + c.name
   @exams = Array.new
   c.exam.each do |exam|
    @exams << {:name => "#{exam.name}",:value => "/exam/#{exam.id}/"}
  end
  back_to_course

  add_breadcrumb c.name, course_path(c)
  add_breadcrumb 'Exams', course_exams_path(c)

end

def curricula
	c = Course.find(params[:id])
	@name = @title = "Curricula related to " + c.name
	@curricula = c.curriculum.order('name ASC').paginate(page: params[:page])
	

	back_to_course

  add_breadcrumb c.name, course_path(c)
  add_breadcrumb "Curricula related to #{c.name}", course_curricula_path(c)

end



def courses_by_year
	@year=params[:course][:year]
	# @courses_by_year=Course.order('accademic_year DESC').all.paginate(page: params[:page])
	date1=Date.new(@year.to_i)
	date2=Date.new(@year.to_i+1)

	@courses_by_year=Course.order('name ASC').where(accademic_year:  date1...date2).paginate(page: params[:page])
	# quick and dirty
	#@courses_by_year=Course.all.paginate(page: params[:page])


	@courses=Array.new
 #Informazioni mostrate: name, teacher, curriculum,year 
	@courses_by_year.each do |course|
		curricula=Array.new
		course.curriculum.each do |curriculum|
			curricula <<{:name => "#{curriculum.name}",:id => curriculum.id}
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

  add_breadcrumb "Course in the year #{@year}", courses_by_year_path(params)
end

def courses_by_type
	@curriculum_id=params[:curriculums][:type]
	@curriculum=Curriculum.find(@curriculum_id)
  @courses=@curriculum.course.sort{|c1,c2| c1.name.downcase <=> c2.name.downcase}

  add_breadcrumb "Course for curriculum #{@curriculum.name}", courses_by_type_path(params)

end





 def type_guided_tour

  @this_course=Course.find(params[:id])
  @curriculum=Curriculum.find(params[:curriculum_id])
  #se params[:page].nil allora vuol dire che arrivo direttamente da
  #courses_by_type, quindi devo mostrare il corso selezionato !
  if  params[:page].nil?
    @page=@curriculum.course.find_index(@this_course)+1
  else
    @page=params[:page]
  end
  @courses=@curriculum.course.paginate(page: @page, per_page:1)
  @total_pages=@curriculum.course.length
  
  gt_type_structural_links
  semantic_links

  add_breadcrumb "Course for curriculum #{@curriculum.name}", courses_type_guided_tour_id_path(@curriculum, @this_course)



end

  

def year_guided_tour
  @year=params[:courses_year]
  @this_course=Course.find(params[:id])
  date1=Date.new(@year.to_i)
  date2=Date.new(@year.to_i+1)
  @courses=Course.order('name ASC').where(accademic_year:  date1...date2)
  
  if  params[:page].nil?
    @page=@courses.find_index(@this_course)+1
  else
    @page=params[:page]
  end
  

  @total_pages=@courses.length
  @courses=@courses.paginate(page: @page, per_page: 1)

  
  gt_year_structural_links
  semantic_links

  add_breadcrumb "Course in the year #{@year}", courses_year_guided_tour_path(@year, @this_course)
end



def index
  @courses=Course.order('name ASC').paginate(page: params[:page])

  add_breadcrumb "Index for courses", course_index_path

end


def new
  @course=Course.new

  add_breadcrumb 'New course', new_course_path(@course)
  
end

def create
  @course=Course.new
  @course.name=params[:course][:name]
  @course.description=params[:course][:description]
  @course.program=params[:course][:program]
  @course.teacher_id=params[:course][:teacher_id]
  @course.classroom_id=params[:course][:classroom_id]
  # curriculum=Curriculum.find(params[:course][:curriculum])
  # curriculum.course << @course
  @course.accademic_year=Date.new params[:course]['accademic_year(1i)'].to_i, params[:course]['accademic_year(2i)'].to_i, params[:course]['accademic_year(3i)'].to_i
  
  if @course.save
    flash_notice_create "Course"

    redirect_to course_path @course
  else
    # flash_error_create "Course"
    render 'new'
  end
  
end

def destroy
  @course=Course.find params[:id]
  if @course.destroy
    flash_notice_destroy "Course"
  else
    # flash_error_destroy "Course"
  end
  redirect_to course_index_path
  
end

def edit
  @course=Course.find params[:id]

  add_breadcrumb 'Edit course', course_edit_path(@course)
end

def update
  @course=Course.find params[:id]
  @course.name=params[:course][:name]
  @course.description=params[:course][:description]
  @course.program=params[:course][:program]
  @course.teacher_id=params[:course][:teacher_id]
  @course.classroom_id=params[:course][:classroom_id]
  # #if the curriculum for the course changed
  # # => delete from old if exist
  # # => add to the new course
  # unless @course.curriculum.exists? params[:course][:classroom_id]
  #     curriculum_old=Curriculum.find(@course.curriculum.id)
  #     curriculum_new=Curriculum.find(params[:course][:classroom_id])
  #     if curriculum_old.course.exists?(@course.id)
  #       curriculum_old.delete(@course)
  #     end
  #     curriculum_new.course << @course
  # end
        
  @course.accademic_year=Date.new params[:course]['accademic_year(1i)'].to_i, params[:course]['accademic_year(2i)'].to_i, params[:course]['accademic_year(3i)'].to_i

  if @course.save
    flash_notice_edit "Course"
    redirect_to course_index_path
  else
    # flash_error_edit "Course"
    render 'edit'
  end
  
end



def build_links
  structural_links
  semantic_links
end

def structural_links
  c = Course.find(params[:id])
  @struct_links = Array.new
  @struct_links << {name: "Description",value: course_path(c)}
  @struct_links << {name:  "Syllabus",value: course_syllabus_path(c)}
  @struct_links << {name:  "Timetable", value: course_timetable_path(c)}
end

def semantic_links
  c = Course.find(params[:id])
  @semant_links = Array.new
  @semant_links << {name: "#{c.teacher.firstname} #{c.teacher.lastname}",value: teacher_path(c.teacher_id)}
  @semant_links << {name: "Materials",value: course_materials_path(c.id)}
  @semant_links << {name: "Exams",value: course_exams_path(c.id)}
  @semant_links << {name: "Classroom",value: classroom_path(c.classroom_id)}
  @semant_links << {name: "Curricula",value: course_curricula_path(c.id)}
  @semant_links << {name: "News",value: course_news_path(c.id)}
end

def gt_type_structural_links
    @struct_links = Array.new
    @struct_links << {name: "Description", value: courses_type_guided_tour_id_path(params[:curriculum_id], params[:id] )}
    @struct_links << {name: "Syllabus", value: courses_type_guided_tour_id_syllabus_path(params[:curriculum_id], params[:id] )}
    @struct_links << {name: "Timetable",  value: courses_type_guided_tour_id_timetable_path(params[:curriculum_id], params[:id] )}
end

def gt_year_structural_links
    @struct_links = Array.new
    @struct_links << {name: "Description", value: courses_year_guided_tour_id_path(params[:courses_year], params[:id] )}
    @struct_links << {name: "Syllabus", value: courses_year_guided_tour_id_syllabus_path(params[:courses_year], params[:id] )}
    @struct_links << {name: "Timetable",  value: courses_year_guided_tour_id_timetable_path(params[:courses_year], params[:id] )}
end




def back_to_course
	c=Course.find(params[:id])
	@semant_links=Array.new
  @semant_links << {name: c.name,value:"/course/#{c.id} "}
end

  
end
