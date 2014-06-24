class Curriculum < ActiveRecord::Base
  has_and_belongs_to_many :course

  #validation
  validates :name, :description, :work_opportunity, presence: true
  validates :name, length: {in: 6...20}
  validates :description, length: {minimum: 20}
  validates :work_opportunity, length: {minimum: 20}
  

  self.per_page = 10


end
