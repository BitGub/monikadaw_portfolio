require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  
  let(:user) { FactoryGirl.create(:user) }
  
  before(:each) do
    sign_in(user)
  end
  
  it 'renders show view' do
    visit admin_user_path(user)
    expect(rendered).to render_template("show")
  end
end
