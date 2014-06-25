class Contact < ActiveRecord::Base
	validates :description, presence:true
end
