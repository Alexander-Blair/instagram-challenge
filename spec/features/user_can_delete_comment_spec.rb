require 'rails_helper'

RSpec.feature "add comment to post", type: :feature do
  let!(:valid_comment) { create(:valid_comment) }

  scenario "creating a post" do
    visit posts_path
    within('#post-' + valid_comment.post.id.to_s) do
      click_link "X"
    end
    expect(page).not_to have_content(valid_comment.content)
  end
end
