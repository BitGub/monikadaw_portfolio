require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  it 'renders show view' do
    visit user_path(@user)
    expect(rendered).to render_template("show")
  end
end
