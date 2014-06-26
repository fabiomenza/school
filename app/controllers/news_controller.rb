class NewsController < ApplicationController
  add_breadcrumb 'Courses', :courses_path
  add_breadcrumb "Index for courses", :course_index_path, only: %w(index new edit)
  add_breadcrumb "Index for news", :course_news_index_path, only: %w(index new edit)
  

  def view
   n = News.find(params[:id])
   @name = n.name
   @time = n.time.to_s(:long)
   @description = n.description

   build_links

   add_breadcrumb  n.course.name, course_path(n.course)
   add_breadcrumb 'News', course_news_path(n.course)
   add_breadcrumb  @name, course_new_path(n.course, n)  
 end

  def new
    @new=News.new
    @course=Course.find(params[:course_id])
     
    add_breadcrumb "New new", new_course_news_path(@course)


    
  end

  def create
    @new=News.new
    @course=Course.find(params[:course_id])
    @new.name=params[:news][:name]
    @new.description=params[:news][:description]
    @new.course_id=params[:course_id]
    time=params[:news]
    @time=Time.new time["time(1i)"], time["time(2i)"], time["time(3i)"], time["time(4i)"], time["time(5i)"]
    @new.time=@time
    if @new.save
      flash_notice_create "New"
      redirect_to course_news_index_path params[:course_id]
    else
      render 'new'
    end
    
  end

  def update
    @new=News.find(params[:id])
    @new.name=params[:news][:name]
    @new.description=params[:news][:description]
    time=params[:news]
    @time=Time.new time["time(1i)"], time["time(2i)"], time["time(3i)"], time["time(4i)"], time["time(5i)"]
    @new.time=@time
    if @new.save
      flash_notice_update "New"
      redirect_to course_news_index_path params[:course_id]
    else
      flash_error_update "New"
      render 'edit'
    end
    
  end

  def edit
    @new=News.find(params[:id])

    
    add_breadcrumb @new.name, edit_course_new_path( params[:course_id], @new)

    
  end

  def destroy
    @news=News.find params[:id]
    course=@news.course
    if @news.destroy
      flash_notice_destroy "New"
    else
      flash_error_destroy "New"
    end

    redirect_to course_news_index_path course
    
  end

  def index
    @news=News.where(course_id: params[:course_id]).paginate(page: params[:page])
    @course_id=params[:course_id]

  end

  def news
  	c=Course.find(params[:id])
  	@course_name=c.name
  	@news=c.news.paginate(page: params[:page])

  	build_links
    
    add_breadcrumb c.name , course_path(c)
    add_breadcrumb 'News', course_news_path(c)
  	
    
  end
 

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
  end
  def semantic_links
	 # n = Course.find(params[:id])
	 # @semant_links = Array.new
	 # @semant_links << {:name => "#{n.name}",:value => course_path(n)}
  end
end
