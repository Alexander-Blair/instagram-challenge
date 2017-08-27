require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:welcome_message) { "Welcome! You have signed up successfully." }

  it "allows a user to sign up" do
    visit('/users/sign_up')
    within(:css, 'form.new_user') do
      fill_in 'user_email', with: 'example@example.com'
      fill_in 'user_username', with: 'Example'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button 'Sign up'
    end
    expect(page).to have_content(welcome_message)
  end
end
