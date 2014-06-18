class Event < ActiveRecord::Base
  belongs_to :structure, inverse_of: :event
  belongs_to :event_type
end
