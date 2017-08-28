require 'rails_helper'

RSpec.feature "Deleting comments", type: :feature do
  let!(:comment_to_delete) { create(:valid_comment) }
  let!(:user) { create(:valid_user) }

  before do
    sign_in(user)
  end

  scenario "deleting comment" do
    visit posts_path
    expect(find('#post-' + comment_to_delete.post.id.to_s)).not_to have_link("X")
  end
end
