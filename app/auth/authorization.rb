# frozen_string_literal: true

class Authorization
  def initialize(request)
    @token = request.headers[:Authorization]
  end

  def current_user
    @user ||= User.find(JsonWebToken.decode(@token)[:user_id]) if @token.present?
  rescue StandardError => e
    e
  end
end
