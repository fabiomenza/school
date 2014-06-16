class Photo < ActiveRecord::Base
  belongs_to :structure, inverse_of: :photo
end
