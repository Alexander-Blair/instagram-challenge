require 'rails_helper'

RSpec.feature "liking a post", type: :feature do
  let!(:example_post) { create(:valid_post) }
  let!(:example_user) { create(:valid_user) }

  before do
    sign_in(example_user)
  end

  scenario "liking a post" do
    visit posts_path
    within('#post-' + example_post.id.to_s) do
      click_button "Like"
    end
    expect(find('#post-' + example_post.id.to_s)
      .find_by_id('new_like'))
      .to have_css("input[src='assets/red-like.png']")
  end
end
