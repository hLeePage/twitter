require 'rails-helper'
require 'request-helper'

RSpec.describe UsersController do
  let(:user1) { FactoryGirl.create :user }

  describe "#index" do
    it "shows all users" do
      user1
      get users_path
      expect(response).to have_http_status(:success)
      expect(json.count).to eq 1
    end
  end

  describe "#create" do
    let(:payload) { { user: FactoryGirl.attributes_for(:user) } }

    it "creates new user" do
      post users_path, payload
      expect(response).to have_http_status(:created)
      expect(json["email"]).to eq payload[:user][:email]
    end

    it "rejects when missing email" do
      payload[:user][:email] = ""
      post users_path, payload
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json).to_not be_empty
    end
  end

  describe "#show" do
    let(:user2) { FactoryGirl.create :user }
    it "shows a user" do
      get users_path(user2)
      expect(response).to have_http_status(:success)
      expect(json[0]["email"]).to eq user2["email"]
    end
  end

end
