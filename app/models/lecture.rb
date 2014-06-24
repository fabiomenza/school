class Lecture < ActiveRecord::Base
	belongs_to :course
	belongs_to :classroom

	#validation
  	validates :w_day, :start_time, :end_time, :course_id, :classroom_id,  presence: true
  	validate :end_time_greater_than_start_time
  	validates :course_id,:classroom_id, numericality: { only_integer: true }


  	#validation method
  	def end_time_greater_than_start_time
  		unless start_time < end_time
  			errors.add(:end_time, "must be greater than start time")
  		end
  	end
end
