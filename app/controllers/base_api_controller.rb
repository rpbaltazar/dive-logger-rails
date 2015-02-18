class BaseApiController < ApplicationController
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  protected

  def json_request?
    request.format.json?
  end
end
