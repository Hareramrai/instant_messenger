FactoryGirl.define do
  factory :message do
    user 
    dialect
    sequence :body do |n|
     "message#{n}"
    end
    trait :binary_message do 
      association :dialect, factory: :binary_dialect
    end 
  end
end
