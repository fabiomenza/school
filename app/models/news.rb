class News < ActiveRecord::Base
  belongs_to :course, inverse_of: :news

  #validation
  validates :name, :description, :time,:course_id, presence: true
  validates :name, length: {in: 6...50}
  validates :description, length: {minimum: 20}
  validates :course_id, numericality: { only_integer: true }
  
end
