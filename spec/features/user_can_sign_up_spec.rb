require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:welcome_message) { "Welcome! You have signed up successfully." }

  it "allows a user to sign up" do
    sign_up("example@example.com", "Example Username", '123456')
    expect(page).to have_content(welcome_message)
  end
end
