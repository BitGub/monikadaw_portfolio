require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:category) { FactoryGirl.create(:category) }
  
  before { @project = FactoryGirl.create(:project, category_id: category.id) }
  
  subject { @project }
  
  it { should respond_to(:name) }
  it { should respond_to(:category_id) }
  it { should respond_to(:description) }
  it { should respond_to(:year) }
  it { should respond_to(:uploads)}
  

  it { should be_valid }
  
  describe "when category is not present" do
    before { @project.category_id = nil } 
    it { should_not be_valid }
  end
  
  describe "when year is not present" do
    before { @project.year = nil }
    it { should_not be_valid }
  end
  
  describe "it should have associated upload" 
  
end
