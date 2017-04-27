require 'rails_helper'

feature 'expectations for an admin' do
  scenario 'admin will see link to Users index page if admin' do
    bob = FactoryGirl.create(:admin)

    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'
    click_link 'Profile'

    expect(page).to have_link('Users')
  end

  scenario 'admin clicks on Users and sees list of users and delete button' do
    bob = FactoryGirl.create(:admin)

    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'
    click_link 'Profile'
    click_link 'Users'

    expect(page).to have_content('Admin Edit Users Page')
  end

  scenario 'admin clicks delete and removes user from database' do
    bob = FactoryGirl.create(:admin)
    User.create(email: 'joe@aol.com', username: 'joeojoe',
      password: 'pickles', admin: false)

    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'
    click_link 'Profile'
    click_link 'Users'
    first(:link, 'delete').click

    expect(page).to_not have_content('joeojoe')
  end

  scenario 'admin can go to list of reviews from profile page' do
    bob = FactoryGirl.create(:admin)

    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'
    click_link 'Profile'
    click_link 'Reviews'

    expect(page).to have_content('Review List:')
  end

  scenario 'admin can delete a review' do
    bob = FactoryGirl.create(:admin)
    game = Game.create(
      title: "Game Game",
      description: "It nice",
      platform: "NES"
      )
    Review.create(
      body: "Game review",
      rating: '3',
      game: game,
      user: bob
      )

    visit new_user_session_path
    fill_in 'Email', with: bob.email
    fill_in 'Username', with: bob.username
    fill_in 'Password', with: bob.password
    click_button 'Log in'

    click_link 'Profile'
    click_link 'Reviews'
    click_link 'delete'
    expect(page).to have_content('Review Deleted')
  end
end
