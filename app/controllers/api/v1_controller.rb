class Api::V1Controller < ApplicationController
  before_action :authenticate_user!

  private
  def authenticate_user!
    head :unauthorized if request.headers['Authorization'].nil? ||
      !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
  end
end
