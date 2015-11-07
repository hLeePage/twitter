class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods


  UnauthenticatedError     = Class.new(ActionController::ActionControllerError)
  UnauthorizedError        = Class.new(ActionController::ActionControllerError)

  rescue_from UnauthenticatedError, with: :unauthenticated

  def authenticate_user!
    raise UnauthenticatedError unless current_user
  end

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def unauthenticated(error)
    head :unauthorized
  end

  def unauthorized(error)
    head :forbidden
  end
end
