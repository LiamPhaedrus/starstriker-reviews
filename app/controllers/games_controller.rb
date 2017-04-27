class GamesController < ApplicationController
  def index
    if Game.search(params[:query])
      @games = Game.search(params[:query])
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    if user_signed_in?
      @game = Game.new
      @platform_collection = Game::PLATFORMS
    else
      flash[:notice] = 'You must be signed in to add a game'
      redirect_to root_path
    end
  end

  def create
    @game = Game.new(game_params)
    if @game.save && user_signed_in?
      flash[:notice] = 'Game successfully saved!'
      redirect_to @game
    else
      @platform_collection = Game::PLATFORMS
      render action: 'new'
    end
  end

  def destroy
    if current_user.admin?
      Game.find(params[:id]).reviews.destroy_all
      Game.find(params[:id]).destroy
      flash[:success] = "Game deleted"
      redirect_to games_path, notice: "Game Deleted"
    else
      redirect_to root_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_year, :platform)
  end
end
