class Service < ActiveRecord::Base
  belongs_to :structure
  belongs_to :classroom
end
