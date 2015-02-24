class Api::V1::UsersController < BaseApiController
  before_filter :validate_token

  #check token validity
  def index
    render json: current_user.as_json, status: :ok
  end

end
