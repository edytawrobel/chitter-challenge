feature 'user log in' do
  scenario 'user that has signed up can log in to app' do
    visit '/'
    click_link('log_in')
    fill_in(:email, with: 'tom@test.com')
    fill_in(:password, with: 'password')
    click_button 'Log in'
  end

end
