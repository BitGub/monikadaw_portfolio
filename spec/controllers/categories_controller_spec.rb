require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  
  before do
    @user = FactoryGirl.create(:user)
  end
  
  describe "GET #index" do
    
    it "returns http success" do
      sign_in(@user)
      visit admin_categories_path
      expect(response).to be_success
      
    end
    
    it "renders index page" do
      sign_in(@user)
      visit admin_categories_path
      expect(response).to render_template("index")
    end
    
    it "cannot be accessed when not loggin in" do
      visit admin_categories_path
      expect(current_path).to eq(login_path)
    end
  end

end