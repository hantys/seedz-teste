FROM ruby:2.7-alpine


RUN apk update
RUN apk add --update --no-cache openssl postgresql-dev build-base tzdata binutils-gold curl file g++ gcc git less libstdc++ libffi-dev libc-dev linux-headers libxml2-dev libxslt-dev libgcrypt-dev make netcat-openbsd pkgconfig libpq-dev


RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install 

COPY . ./ 

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]