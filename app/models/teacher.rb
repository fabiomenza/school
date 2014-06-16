class Teacher < ActiveRecord::Base
  has_many :course, inverse_of: :teacher
end
