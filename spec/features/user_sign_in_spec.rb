require 'rails_helper'

feature 'sign-in' do
  scenario 'if user not signed in, should see link to go to form to log in' do
    visit root_path
    click_link 'Log in'

    expect(page).to have_content("Email")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Remember me")
    expect(page).to have_button("Log in")
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Forgot your password?")
  end

  scenario 'user is already logged in' do
    jerry = User.create(
      email: "JTBarret@places.com",
      username: 'jerry',
      password: "jeckles"
    )
    visit new_user_session_path
    fill_in 'Email', with: jerry.email

    fill_in 'Username', with: 'jerry'
    fill_in 'Password', with: 'jeckles'
    click_button 'Log in'

    expect(page).to_not have_link('Sign up')
    expect(page).to_not have_link("Log in")
    expect(page).to have_link("Profile")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in.")
  end

  scenario 'user successfully signs in' do
    bob = User.create(
      email: "borat@clues.com",
      username: 'bob',
      password: "peckering"
    )
    visit new_user_session_path

    fill_in 'Email', with: bob.email
    fill_in 'Username', with: 'bob'
    fill_in 'Password', with: 'peckering'
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Starstriker's Retro Game Reviews!")
  end

  scenario 'user enters invalid information and cannot sign in' do
    joe = User.create(
      email: "thing@clues.com",
      username: 'joe',
      password: "peckering"
    )
    visit new_user_session_path

    fill_in 'Email', with: joe.email
    fill_in 'Username', with: "joe"
    fill_in 'Password', with: 'hellofriend'
    click_button 'Log in'

    expect(page).to have_content("Invalid Email or password.")
    expect(find_field("Email").value).to have_content(joe.email)
    expect(find_field("Password").value).to be_nil
  end

  scenario 'user clicks link because they forgot their password' do
    visit user_session_path
    click_link 'Forgot your password?'

    expect(page).to have_content('Forgot your password?')
    expect(page).to have_button('Send me reset password instructions')
  end
end
