class Service < ActiveRecord::Base
  has_many :structure
  has_many :classroom
end
