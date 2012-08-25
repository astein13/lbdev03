source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'bootstrap-sass'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'omniauth-facebook'
gem 'eventmachine', '1.0.0.rc.4'
#gem 'thin', '1.3.1'
gem 'jquery-rails'
gem 'rake'      # '>= 0.8.7'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.12'
gem 'heroku'
gem 'koala'
gem 'formtastic'
gem 'resque'
gem 'pg_search'
gem "paperclip", "~> 3.0"
gem 'client_side_validations'
gem 'bcrypt-ruby'
gem 'dynamic_form'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
end

group :test do
  gem 'pg'
  gem 'rspec'
  gem 'webrat'
  gem 'factory_girl_rails', '1.0'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end