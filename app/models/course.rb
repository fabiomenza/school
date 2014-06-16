class Course < ActiveRecord::Base
  belongs_to :teacher, inverse_of:  :classroom
  has_and_belongs_to_many  :curriculum 
  has_many :material, inverse_of:  :classroom
  has_many :exam, inverse_of:  :classroom
  has_one :classroom, inverse_of:  :classroom
  has_many :news, inverse_of:  :classroom

end
