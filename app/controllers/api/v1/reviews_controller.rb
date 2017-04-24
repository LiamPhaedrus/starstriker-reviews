class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destory]
  def create
    review = Review.new(review_params)
    game = Game.find(review_params['game_id'])
    review.user = current_user
    if review.save
      flash[:notice] = "Review added successfully"
      review_to_send = {}
      review_to_send[:id] = review.id
      review_to_send[:body] = review.body
      review_to_send[:rating] = review.rating
      review_to_send[:username] = review.user.username
      render json: {
       status: 201,
       message: ("successfully created a review"),
       review: review_to_send
      }.to_json
    else
      render json: {
        status: 500,
        error: review.errors
      }.to_json
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :game_id)
  end
end
