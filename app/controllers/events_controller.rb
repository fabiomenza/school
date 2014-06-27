class EventsController < ApplicationController
	add_breadcrumb 'Events', :events_path
	
	
  def view
	@types = Array.new
	EventType.all.each do |type|
		@types << {:name => "#{type.name}",:value => "/events/type/#{type.id}/"}
	end
	
	@name = @title = "All events"
	@events = Array.new
	Event.all.each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}/"}
	end
  end


  def type
	type = EventType.find(params[:id])
	@events = Array.new
	@name = @title = type.name + " events"
	type.event.each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}/"}
	end
	add_breadcrumb type.name, "/events/type/#{type.id}/"
  end

  def bydate
	date = params[:date]
	@events = Array.new
	@name = @title = "Events on " + date
	date = Date.strptime(date, "%m/%d/%Y")
	Event.where(:time => date.beginning_of_day..date.end_of_day).each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}/"}
	end
  end
end
