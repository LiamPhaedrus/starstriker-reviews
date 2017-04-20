require 'rails_helper'

feature 'create account', %Q{
    As a prospective user
    I want to create an account
    So that I can post items and review them
  } do
    # Acceptance Criteria:
    # On the sign in page, there is a button to create an account
    # The button does not appear if you are signed in
    # I must enter valid information to sign up
    # If I do enter valid information, I receive an on screen success message
    # If I enter bad information, I recieve an on screen error message and am
    # not signed up

    scenario 'button goes to create account page' do
      visit root_path #further changes can be made
      click_link 'Sign up'
      click_link 'Log in'
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Log in')
    end

    scenario 'specifying valid information' do
      visit new_user_registration_path
      fill_in 'Email', with: 'Koala@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Welcome")
    end

    scenario 'passwords do not match' do
      visit new_user_registration_path
      fill_in 'Email', with: 'X12@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'psassword'
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end


    scenario 'user name is not unique' do
      old_user = User.create(
        email: 'JoeShmo@gmail.com',
        password: 'something',
        password_confirmation: 'something'
        )
      visit new_user_registration_path
      fill_in 'Email', with: 'JoeShmo@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'psassword'
      click_button 'Sign up'
      expect(page).to have_content("Email has already been taken")
    end

    scenario 'valid information is submitted' do
      visit new_user_registration_path
      fill_in 'Email', with: 'Xris@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end  
end
