def sign_in(user)
  visit('/users/sign_in')
  within(:css, 'form.new_user') do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end
end

def sign_up(email, username, password)
  visit('/users/sign_up')
  within(:css, 'form.new_user') do
    fill_in 'user_email', with: email
    fill_in 'user_username', with: username
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Sign up'
  end
end
