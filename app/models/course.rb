class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :curriculum
  has_many :material
  has_many :exam
  has_one :classroom
  has_many :news

end
