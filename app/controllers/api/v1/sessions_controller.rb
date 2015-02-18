class Api::V1::SessionsController < BaseApiController
  before_filter :validate_params, only: [:create]
  before_filter :validate_token, only: [:destroy]

  def create
    user = User.find_for_database_authentication email: params["email"]
    return invalid_login_attempt unless user

    if user.valid_password? params["password"]
      sign_in user
      render json: user.as_json, status: :created
      return
    end

    return invalid_login_attempt
  end

  def destroy
    current_user.authentication_token = ""
    current_user.save
    render json: {}, status: :ok
  end

  private

  def validate_params
    unless params["email"].present? && params["password"].present?
      render json: {error: "Missing parameters"}, status: :bad_request
    end
  end
end
