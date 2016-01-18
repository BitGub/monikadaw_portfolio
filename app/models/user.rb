class User < ActiveRecord::Base
  
  validates_presence_of :email
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
   
  #For Seeding DB
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
