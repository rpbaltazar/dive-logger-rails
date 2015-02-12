class Api::V1::DivesController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :validate_token

  def create
    Dive.create

  end

end
