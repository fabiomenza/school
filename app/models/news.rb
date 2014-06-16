class News < ActiveRecord::Base
  belongs_to :course, inverse_of: :news
end
