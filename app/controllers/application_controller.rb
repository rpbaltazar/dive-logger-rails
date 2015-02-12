class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def validate_token
    #TODO: Implement token system
    # @current_user = User.find_by token: params['auth_token']
    @current_user = User.find params["user_id"]
    if @current_user.nil?
      render json: {error: "invalid auth token"}, status: :bad_request
    end
  end

  def json_request?
    request.format.json?
  end
end
