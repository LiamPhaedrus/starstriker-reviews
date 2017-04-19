class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # user_signed_in?
  # current_user
  # user_session

end
