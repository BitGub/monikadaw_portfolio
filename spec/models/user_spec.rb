require 'rails_helper'

RSpec.describe User, type: :model do

  it 'fails to save when email is not present' do
    @user = FactoryGirl.build(:user, email: nil)
    
    expect(@user).not_to be_valid
  end
  
  it 'fails to save when password is not present' do
    
    @user = FactoryGirl.build(:user, password: nil)
    
    expect(@user).not_to be_valid
  end

end
