class Api::V1::DivesController < BaseApiController
  before_filter :validate_token

  def index
    render json: current_user.dives.as_json, status: :ok
  end

  def create
    dive = current_user.dives.create(dive_params)
    if dive.valid?
      render json: dive.as_json, status: :created
    else
      render json: {error: dive.errors.messages}, status: :bad_request
    end
  end

  private

  def dive_params
    params.require(:dive).permit(
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
