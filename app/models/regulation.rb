class Regulation < ActiveRecord::Base
has_one :bureaucracy

	validates :description, presence:true
	validates :description, length: {minimum: 20}
end