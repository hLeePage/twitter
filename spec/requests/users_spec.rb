require 'request_helper'
require 'pry'

RSpec.describe "Users" do


  describe "#create" do
    it "creates user" do
      payload = {
        user: {
          email: "faker@fake.com",
          password: "password"
        }
      }
      post users_path, payload
      expect(response).to have_http_status(:created)
    end

    it "requires email" do
      payload = {
        user: {
          email: "",
          password: "dowhatnow"
        }
      }
      post users_path, payload
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json["email"]).to_not be_empty
    end
  end


  describe "#index" do
    let(:user1) { FactoryGirl.create :user }
    it "shows multiple users" do
      user1
      get users_path
      expect(response).to have_http_status(:success)
      expect(json.count).to eq 1
    end
  end

  describe "#show" do
    let(:user1) { FactoryGirl.create :user }
    it "shows a user" do
      get users_path, user1
      expect(response).to have_http_status(:success)
      expect(json[0]["username"]).to eq user1["username"]
    end
  end
  describe "#follow" do
    let(:token) { FactoryGirl.create :access_token}
    let(:user) { FactoryGirl.create :user }
    it "allows another user to follow" do
      put  user_follow_path(user.id), {}, {'authorization' => "Bearer #{token.token}"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "#unfollow" do
    let(:token) { FactoryGirl.create :access_token}
    let(:user) { FactoryGirl.create :user }
    it "allows another user to follow" do
      put  user_unfollow_path(user.id), {}, {'authorization' => "Bearer #{token.token}"}
      expect(response).to have_http_status(:success)
    end
  end
end
