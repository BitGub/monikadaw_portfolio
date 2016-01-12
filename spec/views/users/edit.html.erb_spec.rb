require 'rails_helper'

RSpec.describe "users/edit.html.erb", type: :view do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  it 'renders edit view' do
    visit edit_user_path(@user)
    expect(rendered).to render_template("edit")
  end
end
