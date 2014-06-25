class Admin < ActiveRecord::Base
  #To allow login with username
   attr_accessor :login

 def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      else
        where(conditions).first
      end
    end
  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
