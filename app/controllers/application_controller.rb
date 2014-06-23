class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def flash_notice_create object_name
  	flash[:notice]= "#{object_name} successfully created"
  end

  def flash_notice_edit object_name
  	flash[:notice]= "#{object_name} successfully updated"
  end

  def flash_notice_destroy object_name
  	
  	flash[:notice]= "#{object_name} successfully destroyed"
  end

  def flash_error_create object_name
  	flash.now[:error]= "Unable to create #{object_name}"
  end

  def flash_error_edit object_name
  	flash.now[:error]= "Unable to edit #{object_name}"
  end

  def flash_error_destroy object_name
  	
  	flash.now[:error]= "Unable to destroy #{object_name}"
  end

end
