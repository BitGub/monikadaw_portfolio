require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  
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
      expect(current_path).to eq('/admin/uploads')
    end
    
    it "redirects to login page when not logged in" do
      visit admin_users_path
      expect(current_path).to eq(login_path)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      visit edit_admin_user_path(@user)
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to login page when not logged in" do
      visit edit_admin_user_path(@user)
      expect(current_path).to eq(login_path)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      visit admin_user_path(@user)
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to login page when not logged in" do
      visit admin_user_path(@user)
      expect(current_path).to eq(login_path)
    end
  end

end
