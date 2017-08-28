require 'rails_helper'

RSpec.feature "Deleting comments", type: :feature do
  let!(:comment_to_delete) { create(:valid_comment) }

  before do
    sign_in(comment_to_delete.user)
  end

  scenario "deleting comment" do
    visit posts_path
    within('#post-' + comment_to_delete.post.id.to_s) do
      click_link "X"
    end
    expect(page).not_to have_content(comment_to_delete.content)
  end
end
