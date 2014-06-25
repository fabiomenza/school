class Cost < ActiveRecord::Base
	has_one :bureaucray

	validates :description, presence:true
	validates :description, length: {minimum: 20}
end
