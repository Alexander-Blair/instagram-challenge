require 'rails_helper'

RSpec.feature "creating posts", type: :feature do
  let!(:post_to_delete) { create(:valid_post) }
  let!(:new_user) { create(:valid_user) }

  before do
    sign_in(new_user)
  end

  scenario "creating a post" do
    visit posts_path
    within('#post-' + post_to_delete.id.to_s) do
      expect(page).not_to have_link('Delete')
    end
  end
end
