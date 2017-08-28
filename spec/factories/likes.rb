FactoryGirl.define do
  factory :like do
    post { create(:valid_post) }
    factory :valid_like do
      user { create(:valid_user) }
    end
    factory :invalid_like
  end
end
