FactoryGirl.define do
  factory :catergory do
    sequence(:name) { |n| "Catergory#{n}"}
  end

end
