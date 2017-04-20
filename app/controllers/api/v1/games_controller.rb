class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    full = request.original_fullpath
    id = full[6..-1]

    reviews = Game.find(id).reviews
    render json: reviews
  end
end
