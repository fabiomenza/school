class ServicesController < ApplicationController
	add_breadcrumb 'Services', :services_path
	
  def view
	@types = Array.new
	ServiceType.all.each do |type|
		@types << {:name => "#{type.name}",:value => "/services/type/#{type.id}/"}
	end
	
	@name = @title = "All services"
	@services = Array.new
	Service.all.each do |service|
		@services << {:name => "#{service.name}",:value => "/service/#{service.id}/"}
	end
  end


  def type
	type = ServiceType.find(params[:id])
	@services = Array.new
	@name = @title = type.name + " services"
	type.service.each do |service|
		@services << {:name => "#{service.name}",:value => "/service/#{service.id}/"}
	end
  end
end
