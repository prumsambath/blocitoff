require 'rails_helper'

describe 'Authentication' do
  describe 'Sign Up link clicked' do
    it 'creates user information in the database' do
      visit root_path
      expect(page).to have_content('Sign Up')
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

  describe 'Sign In link cliked' do
    it 'signs the user in to the application' do
      user = create(:user)
      user.confirm!
      visit root_path
      expect(page).to have_content('Sign In')
      click_link 'Sign In'

      sign_in user

      expect(page).to have_content(user.full_name)
    end
  end
end
