include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    sequence :description do |n|
      "Post number #{n}"
    end
    factory :valid_post do
      image { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.jpeg'), 'image/png') }
    end
    factory :post_wrong_attachment do
      image { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.jpeg'), 'doc/pdf') }
    end
  end
end
