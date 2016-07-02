class Api::V1::Users::PasswordsController < Devise::PasswordsController
  respond_to :json
end
