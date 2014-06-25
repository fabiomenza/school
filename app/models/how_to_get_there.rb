class HowToGetThere < ActiveRecord::Base

	validates :description, presence:true
	validates :description, length: {minimum: 20}
end
