class Structure < ActiveRecord::Base
  has_many :service
  has_many :event
  has_many :photo
end
