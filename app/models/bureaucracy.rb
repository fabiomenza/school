class Bureaucracy < ActiveRecord::Base
	has_one :regulation
	has_one :cost
	has_one :bursary

	validates :description, presence:true
	validates :description, length: {minimum: 20}
end
