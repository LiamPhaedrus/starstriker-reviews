require 'rails_helper'

feature 'sign-out' do
  scenario 'once user signs up, Logout link is visible in navbar' do
    visit new_user_registration_path
    fill_in 'Email', with: 'Zephyr@pork.com'
    fill_in 'Username', with: 'Zephyr'
    fill_in 'Password', with: 'pickling'
    fill_in 'Password confirmation', with: 'pickling'
    click_button 'Sign up'

    expect(page).to have_link("Home")
    expect(page).to have_link("Profile")
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome! You have signed up successfully")
    expect(page).to_not have_link("Sign up")
    expect(page).to_not have_link("Log in")
  end

  scenario 'once user logs in, Logout link is visible in navbar' do
    beppy = User.create(
      email: "Commerce@deb.com",
      username: "Beppy",
      password: "partridge"
    )

    visit new_user_session_path
    fill_in 'Email', with: beppy.email
    fill_in 'Username', with: 'Beppy'
    fill_in 'Password', with: 'partridge'
    click_button 'Log in'

    expect(page).to have_link("Home")
    expect(page).to have_link("Profile")
    expect(page).to have_link("Logout")
    expect(page).to have_content("Signed in successfully")
    expect(page).to_not have_link("Sign up")
    expect(page).to_not have_link("Log in")
  end

  scenario 'when user is signed in, clicking Logout ends the user session and
            returns to index' do
    jemp = User.create(
      email: "ohara@plane.com",
      username: "Borshwa",
      password: "lobstertail"
    )

    visit new_user_session_path
    fill_in 'Email', with: jemp.email
    fill_in 'Username', with: 'Borshwa'
    fill_in 'Password', with: 'lobstertail'
    click_button 'Log in'

    click_link 'Logout'

    expect(page).to have_content("Signed out successfully")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Log in")
  end
end
