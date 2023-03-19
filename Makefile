ARG=
run:
	docker-compose up -d

start:
	docker-compose up

stop:
	docker-compose down

log:
	docker-compose log

create:
	docker-compose exec app bundle exec rake db:setup db:migrate

migrate:
	docker-compose exec app bin/rails db:migrate

seed:
	docker-compose exec app bin/rails db:seed

console:
	docker-compose exec app rails console

test:
	docker-compose exec app bin/rspec $(ARG)

reset:
	docker-compose exec app bundle exec rake db:drop db:setup db:create db:migrate db:seed

