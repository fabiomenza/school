class Material < ActiveRecord::Base
  belongs_to :course, inverse_of: :material
end
