require 'rails_helper'

RSpec.describe "Projects", type: :request do
  before do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category)
  end
  
  describe "New project" do
    
    it "submits valid form" do
      sign_in(@user)
      visit new_admin_project_path
      
      select @category.name, from: "project[category_id]"
      fill_in "project[description]", with: "This is a long winded description of the Project"
      select "2005", from: "project[year]"
      
      expect { click_button "Create Project" }.to change(Project, :count).by(1)
    end
    
    it "does not submit form with blank category" do
      sign_in(@user)
      visit new_admin_project_path
      
      fill_in "project[name]", with: "Project99"
      fill_in "project[description]", with: "This is a long winded description of the Project"
      select "2005", from: "project_year"

      expect { click_button "Create Project" }.not_to change(Project, :count)
    end
    
    it "does not submit form with blank name" do
      sign_in(@user)
      visit new_admin_project_path
      
      select @category.name, from: "project[category_id]"
      fill_in "project[description]", with: "This is a long winded description of the Project"
      select "2005", from: "project_year"

      expect { click_button "Create Project" }.not_to change(Project, :count)
    end
    
  end
end