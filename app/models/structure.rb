class Structure < ActiveRecord::Base
  has_many :service, inverse_of: :structure
  has_many :event, inverse_of: :structure
  has_many :photo, inverse_of: :structure
  belongs_to :structure_type
end
