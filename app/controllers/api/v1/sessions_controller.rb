# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :authenticate_request

      def signin
        auth_object = Authentication.new(login_params)
        if auth_object.authenticate
          render json: {
            message: 'Login efetuado com sucesso!',
            token: auth_object.generate_token,
            user: UserSerializer.new(auth_object.user).as_json
          }, status: :ok
        else
          render json: {
            message: 'E-mail ou senha incorreta'
          }, status: :unauthorized
        end
      rescue StandardError => e
        render json: {
          message: 'E-mail ou senha não encontrados'
        }, status: :not_found
      end

      def signup
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
      end

      def authenticate_request
        auth = Authorization.new(request)
        @current_user = auth.current_user
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
      end

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
