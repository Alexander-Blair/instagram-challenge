require 'rails_helper'

RSpec.feature "creating posts", type: :feature do
  let!(:post_to_delete) { create(:valid_post) }

  scenario "creating a post" do
    visit posts_path
    within('#post-' + post_to_delete.id.to_s) do
      click_link "Delete"
    end
    expect(page).not_to have_content(post_to_delete.description)
  end
end
