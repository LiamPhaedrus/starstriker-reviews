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

      expect(page).to have_content('Email')
      expect(page).to have_content('6 characters minimum')
    end

    scenario 'passwords do not match' do
      visit new_user_registration_path
      fill_in 'Email', with: 'X12@gmail.com'
      fill_in 'Username', with: 'X12'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'psassword'
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end


    scenario 'user email or username is not unique fails to create new user' do
      old_user = User.create(
        email: 'JoeShmo@gmail.com',
        username: 'JoeShmo',
        password: 'something',
        password_confirmation: 'something'
        )
      visit new_user_registration_path
      fill_in 'Email', with: 'JoeShmo@gmail.com'
      fill_in 'Username', with: 'JoeShmo'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Email has already been taken")
      expect(page).to have_content("Username has already been taken")

    end

    scenario 'valid information is submitted' do
      visit new_user_registration_path
      fill_in 'Email', with: 'Xris@gmail.com'
      fill_in 'Username', with: 'Xris'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
end
