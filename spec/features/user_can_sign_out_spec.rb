require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:user) { create(:valid_user) }

  before do
    visit('/users/sign_in')
    within(:css, 'form.new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
  end

  scenario "allows a user to sign up" do
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
