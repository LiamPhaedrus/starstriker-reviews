require 'rails_helper'

  feature 'user adds avatar' do

  scenario 'valid image is submitted' do
    visit new_user_registration_path
    fill_in 'Email', with: 'Xris@gmail.com'
    fill_in 'Username', with: 'Xris'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file :profile_photo, "#{Rails.root}/spec/support/images/Starstriker.png"
    click_button 'Sign up'

    visit user_path(User.find_by(email: "xris@gmail.com"))

    expect(page).to have_css("img[src*='Starstriker.png']")
  end
end
