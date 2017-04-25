require 'rails_helper'

feature 'user forgot their password' do
  scenario 'user does not enter any email in the field' do
    visit user_session_path
    click_link 'Forgot your password?'
    click_button 'Send me reset password instructions'

    expect(page).to have_content("Email can't be blank")
  end

  scenario 'user enters invalid email' do
    jerry = FactoryGirl.create(:user)

    visit user_session_path
    click_link 'Forgot your password?'
    fill_in 'Email', with: 'jersey@shor.edu'
    click_button 'Send me reset password instructions'

    expect(page).to have_content("Email not found")
  end

  scenario 'user enters valid information for password reset' do
    jerry = FactoryGirl.create(:user)

    visit user_session_path
    click_link 'Forgot your password?'
    fill_in 'Email', with: jerry.email
    click_button 'Send me reset password instructions'

    expect(page).to have_content("You will receive an email with instructions ")
  end
end
