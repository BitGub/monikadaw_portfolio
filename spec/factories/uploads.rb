FactoryGirl.define do
  factory :upload do
    upload "path/to/upload"
    sequence(:title) { |n| "upload#{n}" }
    description "This is a description of the upload"
  end

end
