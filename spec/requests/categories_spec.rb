require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before do
    @user = FactoryGirl.create(:user)
  end
  
  describe "New Category" do
    
    it "submits valid form" do
      sign_in(@user)
      visit new_category_path
    
      fill_in "category[name]", with: "Category99"
      
      expect { click_button "Create Category" }.to change(Category, :count).by(1)
    end
    
    it "does not submit invalid form" do
      sign_in(@user)
      visit new_category_path
    
      expect { click_button "Create Category" }.not_to change(Category, :count)
    end
    
  end
end