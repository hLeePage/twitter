require 'rails_helper'

def json
  JSON.parse(response.body)
end

def get_token
  user = FactoryGirl.create(:user, password: "password")
  payload = {
    grant_type: "password",
    username: user.email,
    password: "password"
  }
  post oauth_token_path, payload
  json
end
