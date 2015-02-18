class BaseApiController < ApplicationController
  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  protected

  def validate_token
    return invalid_login_attempt unless current_user
  end

  def json_request?
    request.format.json?
  end

  def invalid_login_attempt
    render json: {error: "Invalid login"}, status: :bad_request
    return
  end
end
