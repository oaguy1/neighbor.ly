class Api::V1::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json
end
