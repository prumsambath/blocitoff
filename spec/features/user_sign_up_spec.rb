require 'rails_helper'

describe 'User sign up' do
  it 'creates user information in the database' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Sign up'

    expect(page).to have_content(/A message with a confirmation link has been sent to your email address./)
  end
end
