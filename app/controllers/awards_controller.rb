class AwardsController < ApplicationController
  def view
	@name = @title = "School's Awards"
	@awards = Array.new
	Award.all.each do |award|
		@awards << {:name => "#{award.title}",:value => "/award/#{award.id}/", :time => award.date}
	end
  end
end
