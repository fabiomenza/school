class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_breadcrumb  "Home",:root_path
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

  #To use username as login with devise
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end


end
