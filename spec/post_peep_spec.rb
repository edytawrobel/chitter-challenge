require 'spec_helper'
require "./app/models/peep"

feature 'Adding new peeps' do

  scenario 'I can create a new peep' do
    sign_up(name, email, handle, password, password_confirmation)
    log_in
    visit '/peeps/new'
    fill_in 'title', :with => 'Hello'
    fill_in 'message', :with => 'First peep!'
    click_button 'Add Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('First peep!')
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
end
