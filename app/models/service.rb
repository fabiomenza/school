class Service < ActiveRecord::Base
  belongs_to :structure, inverse_of: :service
  belongs_to :classroom, inverse_of: :service
end
