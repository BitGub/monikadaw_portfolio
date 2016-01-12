require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, { id: @user }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show,{ id: @user }
      expect(response).to have_http_status(:success)
    end
  end

end
