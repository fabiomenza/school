class Course < ActiveRecord::Base
  belongs_to :teacher, inverse_of:  :course
  has_and_belongs_to_many  :curriculum 
  has_many :material, inverse_of:  :course
  has_many :exam, inverse_of:  :course
  has_one :classroom, inverse_of:  :course
  has_many :news, inverse_of:  :course
  has_many :lecture


  #validation
  validates :name, :description, :program, :teacher_id, :classroom_id, :accademic_year, presence: true
  validates :name, length: {in: 6...20}
  validates :description, length: {minimum: 20}
  validates :program , length: {minimum: 20}
  validates :teacher_id, numericality: { only_integer: true }


  self.per_page = 4
  def self.max_word 
   15
  end
end
