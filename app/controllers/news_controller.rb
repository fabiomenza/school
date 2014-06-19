class NewsController < ApplicationController
  def view
	n = News.find(params[:id])
	@title = @name = n.name
	@time = n.time.to_s(:long)
	@description = n.description
	build_links
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
