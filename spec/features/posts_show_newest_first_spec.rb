require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.feature "creating posts", type: :feature do
  let(:user) { create(:valid_user) }
  let!(:post_0) { create(:valid_post) }
  let!(:post_1) { create(:valid_post) }

  before do
    sign_in(user)
  end

  scenario "creating a post" do
    visit posts_url
    expect(post_1.description).to appear_before(post_0.description)
    expect(post_1.user.username).to appear_before(post_0.user.username)
  end
end
