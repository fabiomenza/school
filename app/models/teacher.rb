class Teacher < ActiveRecord::Base
  has_many :course, inverse_of: :teacher

  def full_name
  	t=self.find(:id)
  	t.fistname
  end
end
