require 'rails_helper'

RSpec.feature "editing posts", type: :feature do
  let!(:post_to_update) { create(:valid_post) }
  let(:new_description) { "New description" }

  before do
    visit posts_path
    within('#post-' + post_to_update.id.to_s) do
      click_link "Edit"
    end
  end

  scenario "creating a post" do
    fill_in "post_description", with: new_description
    click_button "Update Post"
    expect(page).to have_content(new_description)
  end
end
