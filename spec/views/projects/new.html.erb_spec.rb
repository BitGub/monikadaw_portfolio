require 'rails_helper'

RSpec.describe "projects/new.html.erb", type: :view do
  
  let(:user) { FactoryGirl.create(:user) }
  
  before(:each) do
    sign_in(user)
    visit new_admin_project_path
  end
  
  it 'renders index view'  do
    expect(rendered).to render_template("new")
  end
  
  it 'renders form partial' do
    expect(rendered).to render_template("_form")
  end
  
  it 'renders uploads partial when button is clicked' do
    click_button "Add Photo's"
    expect(rendered).to render_template("/admin/projects/_uploads_browser")
  end
end
