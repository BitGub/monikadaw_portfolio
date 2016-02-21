FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category#{n}"}
    public false
  end

end
