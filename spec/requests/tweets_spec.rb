require 'rails_helper'


RSpec.describe "Tweets" do
  let(:tweet) { FactoryGirl.create :tweet }
  let(:tweet2) { FactoryGirl.create :tweet }
  describe "#index" do
    it "show all tweets" do
      tweet
      tweet2
      get tweets_path
      expect(response).to have_http_status(:success)
      expect(json["data"].count).to eq 2
    end
  end


  describe "#show" do
    it "shows a tweet" do
      get tweets_path, tweet
      expect(response).to have_http_status(:success)
      expect(json["data"][0]["attributes"]["body"]).to eq tweet["body"]
    end
  end


  describe "#create" do

    it "creates a tweet" do
binding.pry
      token = get_token['access_token']
      post tweet_path, payload, {'Authorization' => "Bearer #{token}"}
      expect(response).to have_http_status(:created)
      expect(json["body"]).to eq payload.body
    end
  end
end


# RSpec.describe "Tweets" do
#   let(:payload) {{
#     "user": {
#       "email": "Joe@ensminger",
#       "password": "password"
#     }
#   }}
#   let(:login) {{
#     "grant_type": "password",
#     "username": "user100@example.com",
#     "password": "password"
#   }}
#   let(:tweet) {{
#     "body": "This is in my test suite"
#   }}
#   describe "#index" do
#     it "lists all tweets on page" do
#       User.create(payload)
#       post oauth_token_path, login
#       expect(response).to have_http_status(:success)
#       expect(json["access_token"]).to_not be_empty
#       post tweets_path, tweet
#       expect(response).to have_http_status(:created)
#     end
#   end
# end
