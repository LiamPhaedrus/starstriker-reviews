class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    reviews = []
    Game.find(params[:id]).reviews.each do |review|
      review_to_send = {}
      review_to_send[:id] = review.id
      review_to_send[:body] = review.body
      review_to_send[:rating] = review.rating
      review_to_send[:username] = review.user.username
      reviews << review_to_send
    end
    render json: reviews
  end
end
