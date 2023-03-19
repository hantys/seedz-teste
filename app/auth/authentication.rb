# frozen_string_literal: true

class Authentication
  def initialize(user_params)
    @email = user_params[:email]
    @password = user_params[:password]
    @user = User.find_by(email: @email)
  end

  attr_reader :user

  def authenticate
    @user.valid_password?(@password)
  end

  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
