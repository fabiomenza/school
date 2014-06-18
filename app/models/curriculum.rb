class Curriculum < ActiveRecord::Base
  has_and_belongs_to_many :course

  self.per_page = 10
end
