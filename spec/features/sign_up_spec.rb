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

  scenario 'Can enter user details and create new user' do
     sign_up('Tom', 'tom@test.com', 'tomasov', 'password', 'password')
     expect(User.all.count).to eq 1
   end

   scenario 'Cannot leave the name blank' do
     sign_up('', 'tom@test.com', 'tomasov', 'password', 'password')
     expect(page).to have_content("Name must not be blank ")
   end

   scenario 'email must be unique' do
     sign_up('Tom', 'tom@test.com', 'tomasov', 'password', 'password')
     sign_up('Thomas', 'tom@test.com', 'thor', 'password', 'password')
     expect(page).to have_content("Email is already taken")
   end

   scenario 'Cannot leave the email blank' do
     sign_up('Tom', '', 'tomasov', 'password', 'password')
     expect(page).to have_content("Email must not be blank ")
   end

   scenario 'Cannot leave the handle blank' do
     sign_up('Tom', 'tom@test.com', '', 'password', 'password')
     expect(page).to have_content("Handle must not be blank ")
   end

   scenario 'handle must be unique' do
     sign_up('Tom', 'tom@test.com', 'tomasov', 'password', 'password')
     sign_up('Thomas', 'thomas@test.com', 'tomasov', 'password', 'password')
     expect(page).to have_content("Handle is already taken")
   end

   scenario 'Password and password confirmation must match' do
     sign_up('Tom', 'tom@test.com', 'tomasov', 'password', 'incorrectpassword')
     expect(page).to have_content("Password does not match the confirmation")
   end

end
