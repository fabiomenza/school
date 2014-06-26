module ApplicationHelper
	
	def title(page_title)
		@title=page_title
		"<h1>#{@title}</h1>".html_safe	
	end

end
