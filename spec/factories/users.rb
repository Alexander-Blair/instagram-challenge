FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "example_#{n}@example.com"
    end
    sequence :username do |n|
      "Example Username#{n}"
    end
    factory :valid_user do
      password "123456"
    end
    factory :invalid_user do
      password "1234"
    end
  end
end
