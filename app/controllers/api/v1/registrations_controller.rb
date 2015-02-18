class Api::V1::RegistrationsController < BaseApiController
  before_filter :validate_params

  def create
    user = User.create email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"]
    if user.valid?
      render json: user.as_json, status: :ok
    else
      puts "Problems with the user: #{user.errors.messages}"
      #TODO: Add token for user validation in api requests
      render json: {error: user.errors.messages}, status: :bad_request
    end
  end

  private
  def validate_params
    unless params["email"].present? && params["password"].present? && params["password_confirmation"].present?
      puts "Missing params"
      render json: {error: "Missing parameters"}, status: :bad_request
    end
  end

end
