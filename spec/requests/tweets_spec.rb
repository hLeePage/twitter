require 'rails_helper'
require 'request_helper'

RSpec.describe "Tweets" do
  let(:tweet) { FactoryGirl.create :tweet }
  let(:tweet2) { FactoryGirl.create :tweet }

  describe "#index" do
    it "shows all tweets" do
      tweet
      tweet2
      get tweets_path
      expect(response).to have_http_status(:success)
      expect(json.count).to eq 2
    end
  end

  describe "#show" do
    it "shows a tweet" do
      get tweets_path, tweet

      expect(response).to have_http_status(:success)
      expect(json["data"][0]["attributes"]["body"]).to eq tweet["body"]
    end
  end

  # describe "#create" do
  #   before do
  #     user = FactoryGirl.create(user:"blah", password:"pass")
  #     token = self.authenticate!("blah", "pass")
  #     @payload = { "tweet": {
  #       body: "text"
  #       }
  #     }
  #     end
  #   it "creates a tweet" do
  #     post tweets_path, @payload { 'Authorization' => "Bearer #{token}"}
  #     expect(response).to have_http_status(:created)
  #   end
  # end
end
