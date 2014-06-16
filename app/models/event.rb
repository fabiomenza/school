class Event < ActiveRecord::Base
  belongs_to :structure, inverse_of: :event
end
