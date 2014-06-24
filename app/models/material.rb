class Material < ActiveRecord::Base
  belongs_to :course, inverse_of: :material

  #validation
  validates :name, :description, :multimedia_url, :course_id, presence: true
  validates :name, length: {in: 6...20}
  validates :description, length: {minimum: 20}
  validates :course_id, numericality: { only_integer: true }

end
