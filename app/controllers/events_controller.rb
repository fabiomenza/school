class EventsController < ApplicationController
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
	@name = @title = type.name + " event"
	type.event.each do |event|
		@events << {:name => "#{event.name}",:value => "/event/#{event.id}/"}
	end
  end
end
