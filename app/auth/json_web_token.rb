# frozen_string_literal: true

class JsonWebToken
  JWT_SECRET = ENV['JWT_SECRET'] || "secret"

  ## Gera o token JWT baseado nas informacoes enviadas
  def self.encode(payload, exp = 365.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  ## Decodifica o token JWT e retorna as informacoes do usuario
  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue StandardError => e
    # raise StandardError.new "Erro ao autenticar"
    render json: { error: e }
  end
end
