require 'rails_helper'

  feature 'user Profile page' do
    scenario "clicks link from index page and goes to profile page" do
      jerry = User.create(email: "JTBarret@places.com", username: 'jerry', password: "jeckles")
      visit root_path
      visit new_user_session_path
      fill_in 'Email', with: jerry.email
      fill_in 'Username', with: 'jerry'
      fill_in 'Password', with: 'jeckles'
      click_button 'Log in'
      click_link 'Profile'

      expect(page).to have_content jerry.username
      expect(page).to have_content jerry.email
    end
  end
