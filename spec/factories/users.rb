FactoryGirl.define do
  factory :user do
    email "example@example.com"
    username "Example"
    factory :valid_user do
      password "123456"
    end
    factory :invalid_user do
      password "1234"
    end
  end
end
