# frozen_string_literal: true

class Authorization
  def initialize(request)
    @token = request.headers[:Authorization]
  end

  def current_user
    @user ||= User.find_by(token: JsonWebToken.decode(@token)[:user_token]) if @token.present?
  rescue StandardError => e
    e
  end
end
