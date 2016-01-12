require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :view do
  
  it 'renders index view' do
    visit users_path
    expect(rendered).to render_template("index")
  end
end
