class Api::V1::SessionsController < ApplicationController
  before_filter :validate_params
  protect_from_forgery with: :null_session

  def create
    #TODO: Login
  end

  def destroy
    #TODO: Logout
  end

  private

  def validate_params
    unless params["email"].present? && params["password"].present?
      render json: {error: "Missing parameters"}, status: :bad_request
    end
  end
end
