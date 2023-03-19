source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.6', '>= 6.0.6.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# https://github.com/rails-api/active_model_serializers/tree/0-10-stable/docs
gem 'active_model_serializers'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# https://github.com/heartcombo/devise
gem 'devise'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # https://github.com/faker-ruby/faker
  gem 'faker'

  # https://github.com/ffaker/ffaker
  gem 'ffaker'

  # https://github.com/jwt/ruby-jwt
  gem 'jwt'

  gem 'pry-rails'

  # RSpec for Rails-3+ https://github.com/rspec/rspec-rails
  gem 'rspec-rails'

  gem 'rspec-json_expectations'

  # Collection cardinality matchers, extracted from rspec-expectations
  # https://github.com/rspec/rspec-collection_matchers
  gem 'rspec-collection_matchers'

  # https://github.com/sj26/rspec_junit_formatter
  gem 'rspec_junit_formatter'

  # Code style checking for RSpec files
  # https://github.com/rubocop-hq/rubocop-rspec
  gem 'rubocop-rspec'

  # This gem implements the rspec command for Spring.
  # https://github.com/jonleighton/spring-commands-rspec
  gem 'spring-commands-rspec'

  # Brings back `assigns` and `assert_template` to your Rails tests
  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing'

  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails'

  # https://matchers.shoulda.io, https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda'
  gem 'shoulda-matchers'
  # RuboCop command for Spring
  # https://github.com/toptal/spring-commands-rubocop
  gem 'spring-commands-rubocop'

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  # https://docs.rubocop.org
  # https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 1.48', require: false

  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails'

  # An extension of RuboCop focused on code performance checks.
  # https://github.com/rubocop-hq/rubocop-performance
  gem 'rubocop-performance'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
