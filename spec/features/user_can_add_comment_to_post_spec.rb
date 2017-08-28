require 'rails_helper'

RSpec.feature "add comment to post", type: :feature do
  let!(:example_post_0) { create(:valid_post) }
  let!(:example_post_1) { create(:valid_post) }

  scenario "creating a post" do
    visit posts_path
    within('#post-' + example_post_1.id.to_s) do
      fill_in 'comment_content', with: "This is a comment"
      click_button "Add Comment"
    end
    expect(example_post_1.description).to appear_before(Comment.last.content)
    expect(Comment.last.content).to appear_before(example_post_0.description)
    expect(page).to have_content(Comment.last.content)
  end
end
