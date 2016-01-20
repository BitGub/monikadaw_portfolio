FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project#{n}" }
    description "This is a description of the project"
    year "2000"
    category
  end

end
