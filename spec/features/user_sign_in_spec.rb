require 'rails_helper'

feature 'sign-in' do
    scenario 'if user not signed in, should see link to go to form to log in' do
      visit root_path
      click_link 'Log in'

      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Remember me")
      expect(page).to have_button("Log in")
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Forgot your password?")
    end

    scenario 'user is already logged in' do
      jerry = User.create(email: "JTBarret@places.com", password: "jeckles")

      visit new_user_session_path
      fill_in 'Email', with: 'JTBarret@places.com'
      fill_in 'Password', with: 'jeckles'
      click_button 'Log in'

      expect(page).to_not have_link('Sign up')
      expect(page).to_not have_link("Log in")
      expect(page).to have_link("Profile")

      visit new_user_session_path
      expect(page).to have_content("You are already signed in.")
    end

    scenario 'user successfully signs in' do
      bob = User.create(email: "borat@clues.com", password: "peckering")
      visit new_user_session_path

      fill_in 'Email', with: 'borat@clues.com'
      fill_in 'Password', with: 'peckering'
      click_button 'Log in'

      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Starstriker's Retro Game Reviews!")
    end

    scenario 'user enters invalid information and cannot sign in' do
      bob = User.create(email: "borat@clues.com", password: "peckering")
      visit new_user_session_path

      fill_in 'Email', with: 'borat@clues.com'
      fill_in 'Password', with: 'hellofriend'
      click_button 'Log in'

      expect(page).to have_content("Invalid Email or password.")
      expect(find_field("Email").value).to have_content("borat@clues.com")
      expect(find_field("Password").value).to be_nil
    end
end
