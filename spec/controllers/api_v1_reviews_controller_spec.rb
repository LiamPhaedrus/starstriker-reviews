require 'rails_helper'

describe Api::V1::ReviewsController, type: :controller do
  let(:json_parsed_response) { JSON.parse(response.body) }
  before(:each) do
    @game = FactoryGirl.create(:game)
    @user = FactoryGirl.create(:user)
  end

  describe "POST #create" do
    before(:each) do
      @correct_review_params = {
        body: "This game rocks", rating: 5, game_id: @game.id
      }
    end
    let(:wrong_params) { { rating: 'bob', game_id: @game.id } }

    it "returns the reviews as JSON" do
      sign_in(@user)
      post :create, params: { review: @correct_review_params }

      expect(response.status).to eq 200
      expect(json_parsed_response.keys).to eq ["status", "message", "review"]
    end

    it "successfully creates a review associated with a game" do
      sign_in(@user)

      expect { post :create, params: { review: @correct_review_params } }.to change { @game.reviews.count }.by 1
    end

    it "returns an error with an incorrect payload" do
      post :create, params: { review: wrong_params }

      expect(response.status).to eq 400
      expect(json_parsed_response.keys).to have_content("error")
      expect(json_parsed_response["error"]).to eq ({
        "rating" => ["is not included in the list"],
        "user_id" => ["can't be blank"]
      })
    end
  end

  describe "PATCH #update" do
    let(:review) { Review.create!(body: "first review", rating: 4, game: @game, user: @user) }
    let(:correct_upvote_params) { { id: review.id, vote: true } }
    let(:wrong_vote) { { id: @game.id, vote: 'bob' } }

    it "doesn't change the vote count if a user is not signed in" do
      patch :update, params: { id: review.id, updown: correct_upvote_params }
      expect(response.status).to eq 400
      expect(
        json_parsed_response['error']
      ).to have_content('User must be logged in')
    end

    it "successfully updates the vote count if a user has not voted before" do
      sign_in(@user)
      expect { patch :update, id: review.id, params: { id: review.id, updown: correct_upvote_params } }.to change { review.updowns.count }.by 1
    end

    it "successfully changes the vote if a user has voted before" do
      sign_in(@user)
      Updown.create!(user: @user, review: review, vote: false)
      patch :update, id: review.id, params: { id: review.id, updown: correct_upvote_params }
      expect(
        json_parsed_response['message']
      ).to have_content('you updated your vote')
    end
  end
end
