class Classroom < ActiveRecord::Base
  has_many :service , inverse_of: :classroom
  has_many :course , inverse_of: :classroom
  has_many :lecture





end
