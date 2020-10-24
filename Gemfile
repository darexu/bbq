source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'

gem 'devise'
gem 'devise-i18n'
gem 'pundit'

gem 'resque'

gem 'rails-i18n'

gem 'webpacker', '~> 5.x'

gem 'sassc'

gem 'uglifier', '>= 1.3.0'

gem 'bootsnap', require: false

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'
gem 'dotenv-rails'
gem 'omniauth'
gem 'omniauth-facebook'

group :production do
  gem 'pg'
end

group :test do
  gem 'factory_bot_rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem "capistrano", "~> 3.14", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem 'capistrano-bundler', '~> 2.0'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-passenger'
  gem "capistrano-resque", "~> 0.2.2", require: false
  gem 'listen'
  gem 'letter_opener'
end
