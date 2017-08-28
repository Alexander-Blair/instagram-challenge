require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:user) { create(:valid_user) }

  before do
    sign_in(user)
  end

  scenario "allows a user to sign out" do
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
