include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    sequence :description do |n|
      "Post number #{n}"
    end
    image { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.jpeg'), 'image/png') }
    factory :valid_post do
      user { create(:valid_user) }
    end
    factory :invalid_post
  end
end
