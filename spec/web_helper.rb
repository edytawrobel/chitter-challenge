def sign_up(name, email, handle, password, password_confirmation)
  visit('/')
  click_link('sign_up')
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :handle, with: handle
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Sign Up')
end
