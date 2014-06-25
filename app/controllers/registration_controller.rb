class RegistrationController < Devise::RegistrationsController

	before_filter :authenticate_admin!, :redirect_unless_signed



	private
		def redirect_unless_signed
  			unless  admin_signed_in?
    			redirect_to root_path
  			end
		end
end
