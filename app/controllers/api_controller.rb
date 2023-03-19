# frozen_string_literal: true

class ApiController < ActionController::API
  # USUARIO LOGADO NA API
  attr_reader :current_user

  # skip_before_action :verify_authenticity_token
  # before_action :set_raven_context

  # CALLBACK PARA TORNAR TODAS AS ROTAS AUTENTICAVEIS POR PADRAO
  before_action :authenticate_request

  # FORMATAR ERROS PARA API
  def show_errors_json(object)
    object.errors.map { |key, value| "#{object.class.human_attribute_name(key.to_s.split('.').last.to_sym)}: #{value}" }
  end

  # VERIFICAR SE O USUARIO ESTA AUTENTICADO
  def authenticate_request_token
    token = TokenApi.last&.token
    @is_token = token == params[:token]
    render json: { error: 'Not Authorized' }, status: 401 unless @is_token
  end

  def authenticate_request
    auth = Authorization.new(request)
    @current_user = auth.current_user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :invalid_argument
  # rescue_from StandardError, with: :standard_error
  rescue_from StandardError do |exception|
    render json: { error: exception }, status: :bad_request
  end

  def standard_error
    render json: { error: 'Algo deu errado!' }, status: :bad_request
  end

  def invalid_argument
    render json: { error: 'Invalid Argument' }, status: :bad_request
  end

  def record_not_found
    render json: { error: 'Not Found' }, status: 404
  end
end
