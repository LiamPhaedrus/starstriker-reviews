require "rails_helper"

feature "registered user can add games" do
  scenario "signed in users can go to a form to add a game" do
    bob = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'

    click_link 'Add Game'

    expect(page).to have_content('New Game Form')
  end
  scenario "users not signed in don't see add game link" do
    visit "/"
    expect(page).to_not have_content('Add Game')
  end
  scenario "signed in users can successfully add a game" do
    bob = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'

    visit new_game_path

    fill_in 'Title', with: 'Title of a Game'
    fill_in 'Description', with: 'Some kind of description'
    fill_in 'Platform', with: 'NES'
    fill_in 'Release Year', with: '1990'
    click_button 'Add this Game'

    expect(page).to have_content('Game successfully saved!')
    expect(page).to have_content('Title of a Game')
    expect(page).to have_content('Some kind of description')
    expect(page).to have_content('NES')
    expect(page).to have_content('1990')
  end
  scenario "signed in users don't add game if information is invalid" do
    bob = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'

    visit new_game_path

    click_button 'Add this Game'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Platform can't be blank")
    expect(page).to have_content("Release year is not a number")
    expect(page).to have_content("Release year is the wrong length")
    expect(page).to have_content("(should be 4 characters)")
  end
end
