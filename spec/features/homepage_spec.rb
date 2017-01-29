require 'spec_helper'

feature 'homepage' do
  scenario 'user can visit the homepage' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome to Chitter! Up for a chat or a peep?')
  end
end
