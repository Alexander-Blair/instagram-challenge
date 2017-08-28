require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:user) { create(:valid_user) }

  scenario "allows a user to sign up" do
    sign_in(user)
    expect(page).to have_content("Signed in successfully.")
  end
end
