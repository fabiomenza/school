class Course < ActiveRecord::Base
  belongs_to :teacher, inverse_of:  :course
  has_and_belongs_to_many  :curriculum 
  has_many :material, inverse_of:  :course
  has_many :exam, inverse_of:  :course
  has_one :classroom, inverse_of:  :course
  has_many :news, inverse_of:  :course

  self.per_page = 10
  def self.max_word 
   15
  end
end
