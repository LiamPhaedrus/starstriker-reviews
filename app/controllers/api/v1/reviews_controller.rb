# class Api::V1::ReviewsController < ApplicationController
#   skip_before_action :verify_authenticity_token
#   def create
#     review = Review.new(review_params)
#     game = game.find(params[:game_id])
#     review.game = game
#     if review.save
#       flash[:notice] = "Review added successfully"
#       render json: {
#        status: 201,
#        message: “successfully created thing!”),
#        thing: thing
#       }.to_json
#
#     else
#       flash[:alert] = "Failed to save that review"
#       render :new
#     end
#   end
#
#   private
#
#   def review_params
#     params.require(:review).permit(:body, :rating, :game_id, :user_id)
#   end
# end
