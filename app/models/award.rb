class Award < ActiveRecord::Base


  validates :title, :description, :date, presence: true
  validates :title, length: {in: 6...20}
  validates :description, length: {minimum: 20}
  
end
