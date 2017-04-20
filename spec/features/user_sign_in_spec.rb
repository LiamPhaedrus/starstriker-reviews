# require 'rails_helper'
#
# feature 'sign-in', %Q{
#     'As an unauthenticated user -
#     I want to sign in -
#     So that I can post items and review them'
#   } do
#     scenario 'user is not authenticated'
#       visit new_user_session_path
#       it 'must sign in a user' do
#
#       @controller.current_user.must_equal nil
#       post :create, format: :js, user: {email: @user.email, password: @user.password, remember_me: 0}
#       assert_response :success
#       @controller.current_user.must_equal @user
#     end
# end
