require 'rails_helper'

RSpec.describe Catergory, type: :model do
  
  it 'saves a valid category' do
    catergory = FactoryGirl.build(:catergory)
    
    expect(catergory).to be_valid
  end
  
  it 'does not save when name is blank' do
    catergory = FactoryGirl.build(:catergory, name: nil)
    expect(catergory).not_to be_valid
  end
  
  it 'does not save when name exists' do
    catergory1 = FactoryGirl.create(:catergory, name: "Catergory0")
    catergory2 = FactoryGirl.build(:catergory, name: "Catergory0")
    expect(catergory2).not_to be_valid
  end
end
