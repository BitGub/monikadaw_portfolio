require 'rails_helper'

RSpec.describe Upload, type: :model do
  before { @upload = FactoryGirl.build(:upload) }
  
  subject { @upload }
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:projects) }
  
  
end