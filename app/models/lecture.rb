class Lecture < ActiveRecord::Base
	belongs_to :course
	belongs_to :classroom
end
