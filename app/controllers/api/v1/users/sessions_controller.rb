class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?

    token = AuthToken.issue_token({ user_id: resource.id })
    render json: {user: resource.email, token: token}
  end

end
