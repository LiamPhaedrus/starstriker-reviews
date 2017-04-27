class ReviewsController < ApplicationController
  def index
    if user_signed_in? && current_user.admin?
      @reviews = Review.all
      @games = Game.all
    else
      redirect_to root_path
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    if current_user.admin?
      Review.find(params[:id]).destroy
      flash[:success] = "Review deleted"
      redirect_to games_path, notice: "Review Deleted"
    else
      redirect_to root_path
    end
  end
end
