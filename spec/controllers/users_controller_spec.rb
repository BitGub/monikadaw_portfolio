require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in(@user)
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to index page upon success" do
      sign_in(@user)
      expect(current_path).to eq('/users/index')
    end
    
    it "redirects to login page when not logged in" do
      visit users_path
      expect(current_path).to eq(login_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      visit edit_user_path(@user)
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to login page when not logged in" do
      visit edit_user_path(@user)
      expect(current_path).to eq(login_path)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      visit user_path(@user)
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to login page when not logged in" do
      visit user_path(@user)
      expect(current_path).to eq(login_path)
    end
  end

end
