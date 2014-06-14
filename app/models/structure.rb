class Structure < ActiveRecord::Base
  has_many :service
  has_many :events
end
