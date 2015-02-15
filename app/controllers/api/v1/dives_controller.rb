class Api::V1::DivesController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :validate_token

  def create
    dive = @current_user.dives.create(params[:dive])
    # dive = Dive.create(
    #   location_name: params["location_name"],
    #   dive_date: Date.parse(params["dive_date"]),
    #   pressure_in: params["pressure_in"],
    #   pressure_out: params["pressure_out"],
    #   actual_bottom_time: params["actual_bottom_time"],
    #   time_in: DateTime.parse("#{params['dive_date']} #{params["time_in"]}"),
    #   time_out: DateTime.parse("#{params['dive_date']} #{params["time_out"]}"),
    #   user: @current_user.id
    # )
    if dive.valid?
      render json: dive.as_json, status: :ok
    else
      render json: {error: dive.errors.messages}, status: :bad_request
    end
  end

  private

  def dive_params
    params.permit(
      :location_name,
      :dive_date,
      :pressure_in,
      :pressure_out,
      :actual_bottom_time,
      :time_in,
      :time_out
    )
  end
end
