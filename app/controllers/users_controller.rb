class UsersController < ApplicationController
  require "pg_search"
  def show
    @user = User.find(params[:id])
  end

  def index
    if user_signed_in? && current_user.admin?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_path, notice: "User Account Deleted"
    else
      redirect_to root_path
    end
  end
end
