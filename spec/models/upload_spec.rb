require 'rails_helper'

RSpec.describe Upload, type: :model do
  before { @upload = FactoryGirl.create(:upload) }
  
  subject { @upload }
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:projects) }
  
  
  it 'should set trashed to true when archived' do
    Upload.archive(@upload.id)
    expect(@upload.trashed).to eq(true)
  end
end