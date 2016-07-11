class Api::V1Controller < ApplicationController
  before_action :authenticate_user!

  private
  def authenticate_user!
    decoded = AuthToken.valid?(auth_token)
    unless decoded.blank?
      @current_user = User.where(:id => decoded['user_id']).first
      if @current_user.blank?
        head :unauthorized
      end
    else
      head :unauthorized
    end
  end

  def auth_token
    @auth_token = unless request.headers['Authorization'].nil?
                    request.headers['Authorization'].split(' ').last
                  else
                    ""
                  end
  end

  def validation_error_message(model)
    {
      success: false,
      model: model.class.name,
      errors: model.errors.full_messages
    }
  end
end
