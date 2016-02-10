require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
  
  before do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category)
    @project = FactoryGirl.create(:project, category_id: @category.id)
  end
  
  describe "GET #index" do
    
    it "returns http success" do
      sign_in(@user)
      visit admin_projects_path
      expect(response).to be_success
      
    end
    
    it "renders index page" do
      sign_in(@user)
      visit admin_projects_path
      expect(response).to render_template("index")
    end
    
    it "cannot be accessed when not loggin in" do
      visit admin_projects_path
      expect(current_path).to eq(login_path)
    end
  end

end