# Quick and dirty methods for dealing with JWT auth tokens
# Shamelessly stolen from https://github.com/jimjeffers/rails-devise-cors-jwt-example/blob/master/lib/auth_token.rb

require 'jwt'

module AuthToken
  def AuthToken.issue_token(payload)
    payload['exp'] = 1.week.from_now.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def AuthToken.valid?(token)
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    rescue
      false
    end
  end
end
