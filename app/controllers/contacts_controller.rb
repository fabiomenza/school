class ContactsController < ApplicationController
	add_breadcrumb 'Contacts', :contact_path

  def view
	@title = "Contacts"
	@contact=Contact.find 1
  end

  def edit
    @contact=Contact.find 1  	
    add_breadcrumb 'Edit', edit_contacts_path
  	
  end

  def update
    @contact=Contact.find 1
    if @contact.update(contact_params)
      flash_notice_edit "Contacts"
      redirect_to contact_path
    else
      
      render 'edit'
    
    end
    
  end



  private
    def contact_params
            params.require(:contact).permit(:description) 
    end
end
