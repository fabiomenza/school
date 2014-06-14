class Classroom < ActiveRecord::Base
  has_many :service
  has_many :course
end
