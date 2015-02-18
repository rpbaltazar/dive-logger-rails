class Api::V1::SessionsController < BaseApiController
  before_filter :validate_params

  def create
    user = User.find_for_database_authentication email: params["email"]
    invalid_login_attempt unless user

    if user.valid_password? params["password"]
      sign_in user
      render json: user.as_json, status: :ok
      return
    end

    return invalid_login_attempt
  end

  def destroy
    
  end

  private

  def validate_params
    unless params["email"].present? && params["password"].present?
      render json: {error: "Missing parameters"}, status: :bad_request
    end
  end

  def invalid_login_attempt
    render json: {error: "Invalid login"}, status: :bad_request
    return
  end
end
