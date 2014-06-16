class Exam < ActiveRecord::Base
  belongs_to :course, inverse_of: :exam
  belongs_to :classroom, inverse_of: :exam
end
