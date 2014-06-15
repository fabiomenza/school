class Course < ActiveRecord::Base
  belongs_to :teacher
  has_and_belongs_to_many  :curriculum
  has_many :material
  has_many :exam
  has_one :classroom
  has_many :news

end
