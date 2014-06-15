class EventsController < ApplicationController
  def view
	@name = @title = "All events"
	@events = Array.new
	Event.all.each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}/"}
	end
  end
end
