class User < ActiveRecord::Base
  
  validates_presence_of :email, :password
  
  has_secure_password
  
  #For Seeding DB
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
