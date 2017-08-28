FactoryGirl.define do
  factory :comment do
    content "MyString"
    user { create(:valid_user) }
    factory :valid_comment do
      post { create(:valid_post) }
    end
    factory :invalid_comment
  end
end
