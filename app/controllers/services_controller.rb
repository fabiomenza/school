class ServicesController < ApplicationController
  def view
	@name = @title = "All services"
	@services = Array.new
	Service.all.each do |service|
		@services << {:name => "#{service.name}",:value => "/service/#{service.id}/"}
	end
  end
end
