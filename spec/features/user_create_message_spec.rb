require 'rails_helper'

feature 'User create message' do
  scenario 'i should able to create message.' do
    user = build(:user)
    sign_up_with user.username, user.dialect_name 

    expect(page).to have_content('You have joined successfully.')
    expect(page).to have_content(user.username)
    
    fill_in "message_body", with: "Hello"
    click_button "Send Message"
    visit messages_path 
    expect(page).to have_content('Hello')
  end

  scenario 'it should failed to create without message body' do
    user = build(:user)
    sign_up_with user.username, user.dialect_name 
    previous_count = Message.count 
    fill_in "message_body", with: ""
    click_button "Send Message"
    visit messages_path 
    expect(previous_count).to eq(Message.count)
  end

  def sign_up_with(email, dialect)
    visit new_user_path
    fill_in "Username", :with => email
    select(dialect, from: 'Dialect')
    click_button "Join Now"
  end

end