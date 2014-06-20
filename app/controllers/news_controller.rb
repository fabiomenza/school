class NewsController < ApplicationController
  def view
	n = News.find(params[:id])
	@title = @name = n.name
	@time = n.time.to_s(:long)
	@description = n.description
	build_links
  end

  def new
    @new=News.new
    @course=Course.find(params[:course_id])
    
  end

  def create
    @new=News.new
    @new.name=params[:news][:name]
    @new.description=params[:news][:description]
    @new.course_id=params[:course_id]
    time=params[:news]
    @time=Time.new time["time(1i)"], time["time(2i)"], time["time(3i)"], time["time(4i)"], time["time(5i)"]
    @new.time=@time
    if @new.save
      redirect_to news_path(@new)
    else
      render 'edit'
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
      redirect_to news_path(@new)
    else
      render 'edit'
    end
    
  end

  def edit
    @new=News.find(params[:id])

    
  end

  def destroy
    @news=News.find params[:id]
    course=@news.course
    @news.destroy

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
  	
  end



 

  def build_links
	structural_links
	semantic_links
  end
  def structural_links
  end
  def semantic_links
	n = News.find(params[:id])
	@semant_links = Array.new
	@semant_links << {:name => "#{n.course.name}",:value => "/course/#{n.course.id}/"}
  end
end
