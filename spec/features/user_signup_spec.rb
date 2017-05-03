require 'rails_helper'

feature 'User Signup' do
  scenario 'i should able to signup with valid data.' do
    create(:dialect)
    visit new_user_path
    fill_in "Username", :with => "hareramrai"
    select('Yoda', from: 'Dialect')
    click_button "Join Now"
    expect(page).to have_content('You have joined successfully.')
  end

  scenario 'it should failed to signup without username or dialect' do
    visit new_user_path
    fill_in "Username", :with => nil
    select('', from: 'Dialect')
    click_button "Join Now"
    expect(page).to have_content('Username is mandatory and unique, please specify one')
    expect(page).to have_content('Dialect is needed for translation')
  end

end