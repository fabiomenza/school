class Lecture < ActiveRecord::Base
	belongs_to :course
	belongs_to :classroom

	#validation
  	validates :w_day, :start_time, :end_time, :course_id, :classroom_id,  presence: true
  	validate :end_time_greater_than_start_time
    validate :lecture_not_overlapping
  	validates :course_id,:classroom_id, numericality: { only_integer: true }


  	#validation method
    #Check if the end time of the lesson is greater than the starting time
  	def end_time_greater_than_start_time
  		unless start_time < end_time
  			errors.add(:end_time, "must be greater than start time")
  		end
  	end
    #check if two lectures overlap
    def lecture_not_overlapping
      lectures=Lecture.where("course_id= ? AND w_day= ?", course_id, w_day )
      lectures.each do |l|
        if (l.start_time.hour <= end_time.hour) and (start_time.hour <= l.end_time.hour)
          errors.add('Lecture', "overlapping with one on #{l.w_day} from #{l.start_time.strftime("%R")} to #{l.end_time.strftime("%R")}")
        end
      end
    end

end
