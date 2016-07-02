class Api::V1::Users::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json
end
