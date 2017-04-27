require 'rails_helper'

describe Api::V1::GamesController, type: :controller do

  let(:json_parsed_response) { JSON.parse(response.body) }

  describe "GET #show" do
    before(:each) do
      @game = FactoryGirl.create(:game)
      @other_game = FactoryGirl.create(:game)
      @user = FactoryGirl.create(:user)
      @review_one = Review.create(
        body: "first review", rating: 4, game: @game, user: @user
      )
      @review_two = Review.create(
        body: "another review", rating: 4, game: @game, user: @user
      )
      @review_three = Review.create(
        body: "third review for test", rating: 4, game: @other_game, user: @user
      )
    end

    it "returns JSON" do
      get :show, params: { id: @game.id }
      expect(response.status).to eq 200
      expect(json_parsed_response.keys).to eq ["reviews", "user"]
      expect(json_parsed_response["reviews"][0].keys).to eq [
        "id", "body", "rating", "username", "votes", "created_at"
      ]
    end

    describe "it returns review data" do
      it "returns review data and sign-in status to an unsigned in user" do
        get :show, params: { id: @game.id }

        expect(json_parsed_response["reviews"].length).to eq 2
        expect(
          json_parsed_response["reviews"]
        ).to have_content(@review_one.body)
        expect(
          json_parsed_response["reviews"].first
        ).to_not have_content(@review_three.body)
        expect(json_parsed_response["user"]).to eq false
      end
      it "when signed in it returns review data and id of signed-in user" do
        sign_in(@user)
        get :show, params: { id: @game.id }

        expect(json_parsed_response["reviews"].length).to eq 2
        expect(
          json_parsed_response["reviews"]
        ).to have_content(@review_one.body)
        expect(
          json_parsed_response["reviews"].first
        ).to_not have_content(@review_three.body)
        expect(json_parsed_response["user"]).to eq(@user.id)
      end
    end
  end
end
