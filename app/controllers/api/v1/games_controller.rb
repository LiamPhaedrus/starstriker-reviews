class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    reviews = Game.find(params[:id]).reviews
    render json: reviews
  end
end
