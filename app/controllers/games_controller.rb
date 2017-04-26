class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @platform_collection = Game::PLATFORMS
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = 'Game successfully saved!'
      redirect_to @game
    else
      @platform_collection = Game::PLATFORMS
      render action: 'new'
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_year, :platform)
  end
end
