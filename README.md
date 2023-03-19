## Instalação e execução da aplicação

Passos.

1. Criar banco e rodar migrações: ``$ docker-compose exec app bundle exec rake db:setup db:migrate``.
2. Rodar seed: ``$ docker-compose exec app bundle exec rake db:seed``.
3. Iniciar a aplicação: ``$ docker-compose up -d``.
4. Desligar a aplicação: ``$ docker-compose down``.
5. Arquivo do insominia aqui.
6. Usuário para login ``cliente@cliente.com`` senha ``123456``.
6. Ao logar, utilizar o token, que vem no retorno para acessar as demais paginas utilizando o seguinte HEADER ``Content-Type: application/json
Authorization: $token
``.

