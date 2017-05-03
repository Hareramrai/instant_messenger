FactoryGirl.define do
  factory :user do
    sequence :username do |n|
     "username#{n}"
    end
    dialect
  end
end
