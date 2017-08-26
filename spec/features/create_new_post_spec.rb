require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.feature "creating posts", type: :feature do
  let(:description) { "Hello, world!" }
  let(:attach_file) { "#{::Rails.root}/spec/fixtures/test_image.jpeg" }
  before do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
  end

  scenario "creating a post" do
    visit new_post_path
    fill_in "post_description", with: description
    find('form input[type="file"]').set(attach_file)
    click_button "Create Post"
    expect(page).to have_content(description)
  end
end
