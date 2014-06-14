class Exam < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
end
