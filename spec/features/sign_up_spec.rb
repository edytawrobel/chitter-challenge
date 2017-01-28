require 'spec_helper'
require 'web_helper'
require './app/models/user'

# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_link('sign_up')
    expect(page.current_path).to eq "/users/new"
  end

  scenario 'Can fill in the form' do
    visit('/')
    click_link('sign_up')
    fill_in :name, with: 'Tom'
    fill_in :email, with: 'tom@test.com'
    fill_in :handle, with: 'tomasov'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button('Sign Up')
  end

end
