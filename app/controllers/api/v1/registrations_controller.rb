class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token#, if: :json_request?
  before_filter :validate_params

  def create
    render json: {}, status: :ok
  end

  private

  def validate_params
    unless params["email"].present? && params["password"].present? && params["password_confirmation"].present?
      render json: {error: "Missing parameters"}, status: :bad_request
    end
  end
end
