require 'rails_helper'

feature 'user can edit profile' do
  scenario 'user sees edit page' do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Username', with: jerry.username
    fill_in 'Password', with: jerry.password
    click_button 'Log in'
    click_link 'Profile'

    click_link 'Edit Your Profile'
  end

  scenario 'user submits valid changes successfully' do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Username', with: jerry.username
    fill_in 'Password', with: jerry.password
    click_button 'Log in'
    click_link 'Profile'

    click_link 'Edit Your Profile'

    fill_in 'Email', with: 'jerry@example.com'
    fill_in 'Current password', with: jerry.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    click_link 'Profile'
    expect(page).to have_content('jerry@example.com')
  end
  scenario 'user must enter current password to change anything' do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Username', with: jerry.username
    fill_in 'Password', with: jerry.password
    click_button 'Log in'
    click_link 'Profile'

    click_link 'Edit Your Profile'

    fill_in 'Email', with: 'jerry@example.com'
    click_button 'Update'

    expect(page).to have_content("Current password can't be blank")
    expect(find_field("Email").value).to have_content('jerry@example.com')
  end
  scenario 'user can delete their account' do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Username', with: jerry.username
    fill_in 'Password', with: jerry.password
    click_button 'Log in'
    click_link 'Profile'

    click_link 'Edit Your Profile'
    click_button 'Cancel my account'
    expect(page).to have_content('Your account has been successfully cancelled')
  end

  scenario 'user can click Back and return to user profile page' do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Username', with: jerry.username
    fill_in 'Password', with: jerry.password
    click_button 'Log in'
    click_link 'Profile'

    click_link 'Edit Your Profile'
    click_link 'Back'
    expect(page).to have_content("#{jerry.username}'s Profile")
  end
end
