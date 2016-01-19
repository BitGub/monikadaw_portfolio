require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it 'saves a valid category' do
    category = FactoryGirl.build(:category)
    
    expect(category).to be_valid
  end
  
  it 'does not save when name is blank' do
    category = FactoryGirl.build(:category, name: nil)
    expect(category).not_to be_valid
  end
  
  it 'does not save when name exists' do
    category1 = FactoryGirl.create(:category, name: "Category0")
    category2 = FactoryGirl.build(:category, name: "Category0")
    expect(category2).not_to be_valid
  end
end
