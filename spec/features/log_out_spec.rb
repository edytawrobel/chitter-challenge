feature 'User signs out' do

  User.create(email: "tom@test.com",
     password: "password", password_confirmation: "password",
     name: "Thomas", handle: "tomasov")

  scenario 'while being signed in' do
    sign_in(email: 'tom@test.com', password: 'password')
    click_link 'log_out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Thomas')
  end


  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log in'
  end


end
