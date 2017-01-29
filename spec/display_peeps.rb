require 'spec_helper'
require './app/models/peep'

feature 'Displaying peeps' do
  scenario 'Previously written peeps are visible on the page' do
    sign_up
    log_in
    add_peep
    expect(page.status_code).to eq 200
    expect(page).to have_content('Funtastic!')
  end


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

  def log_in(email: 'tom@test.co.uk', password: 'password')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

  def add_peep
    visit '/peeps/new'
    fill_in :title, with: 'Help'
    fill_in :message, with: 'Funtastic!'
    click_button 'Add Peep'
  end

end
