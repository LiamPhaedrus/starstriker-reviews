class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]
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
      review_to_send[:created_at] = review.created_at
      render json: {
       status: 201,
       message: ("successfully created a review"),
       review: review_to_send
      }.to_json
    else
      flash[:notice] = "Review failed to save"
      render json: {
        status: 500,
        error: review.errors
      }.to_json
    end
  end

  def update
    review = Review.find(update_params['id'])
    @game_id = review.game.id
    updown = review.updowns.find_by(user: current_user)
    if !updown
      new_vote = Updown.new(
        review: review,
        user: current_user,
        vote: update_params['vote']
      )

      if new_vote.valid?
        new_vote.save
        render json: {
          status: 201,
          message: "You voted on a review!",
          reviews: updated_reviews
        }.to_json
      else
        render json: {
          status: 500,
          error: new_vote.errors.full_messages
        }.to_json
      end
    elsif updown.update!(vote: update_params['vote'])
      render json: {
        status: 201,
        message: "you updated your vote!",
        reviews: updated_reviews
      }.to_json
    else
      render json: {
        status: 500,
        error: updown.errors
      }.to_json
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :game_id)
  end

  def update_params
    params.require(:updown).permit(:id, :vote)
  end

  def updated_reviews
    reviews = []
    Review.where(game_id: @game_id).each do |review|
      review_to_send = {}
      review_to_send[:id] = review.id
      review_to_send[:body] = review.body
      review_to_send[:rating] = review.rating
      review_to_send[:username] = review.user.username
      updowns = []
      review.updowns.each do |updown|
        thing = {}
        thing[:votes] = updown.vote
        thing[:reviewer] = updown.user_id
        updowns << thing
      end
      review_to_send[:votes] = updowns
      review_to_send[:created_at] = review.created_at
      reviews << review_to_send
    end
    reviews
  end
end
