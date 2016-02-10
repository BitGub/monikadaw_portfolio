require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :view do
  
  let(:user) { FactoryGirl.create(:user) }
  
  before(:each) do
    sign_in(user)
  end
  
  it 'renders index view' do
    visit admin_users_path
    expect(rendered).to render_template("index")
  end
end
