class ApplicationController < ActionController::API

  UnauthenticatedError     = Class.new(ActionController::ActionControllerError)
  UnauthorizedError        = Class.new(ActionController::ActionControllerError)

  rescue_from UnauthenticatedError, with: :unauthenticated
  rescue_from UnauthorizedError, with: :unauthorized

  def authenticate_user!
    raise UnauthenticatedError unless current_user
  end

  def current_user
     User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end

# in rspec...
# log in via POST, save the token, use it for the next POST.
# As soon as you exit an if block, the database is wiped.

# if testing the ability to post tweets, use a method in request helper, which requires rails-helper,
# which requires spec helper

# we don't want a users/login route, we want it to go to POST oauth/token.
# Chrome only allows GET requests.

# Is super useful to write tests here!!

# specs/requests is good. Don't use specs/controllers, but if you did, "post :create" calls a method without
# needing a route, i.e, you don't know if your test is getting to the right controller in the first place.

# feature specs for testing a non-api
