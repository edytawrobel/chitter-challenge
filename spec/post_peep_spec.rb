# require 'spec_helper'
# require "./app/models/peep"
#
# feature 'Adding new peeps' do
#
#   scenario 'I can create a new peep' do
#     log_in
#     visit '/peeps/new'
#     fill_in 'title', :with => 'Hello'
#     fill_in 'message', :with => 'First peep!'
#     click_button 'Add Peep'
#     expect(current_path).to eq '/peeps'
#
#     within 'ul#peeps' do
#       expect(page).to have_content('First peep!')
#     end
#
#     def log_in(email: 'tom@test.co.uk', password: 'password')
#       visit '/sessions/new'
#       fill_in :email, with: email
#       fill_in :password, with: password
#       click_link 'log_in'
#     end
#
#     def add_peep
#       visit '/peeps/new'
#       fill_in :title, with: 'Help'
#       fill_in :message, with: 'Funtastic!'
#       click_button 'Add Peep'
#     end
#   end
# end
