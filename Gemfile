source 'https://rubygems.org'
ruby '2.5.0'
gem 'rails'
gem 'rails-i18n'

group :assets do
  gem 'uglifier'
  gem 'sprockets'
  gem 'sprockets-rails'
  gem 'coffee-rails'
end

gem 'aws-sdk', '< 3.0'
gem 'bcrypt-ruby'
gem 'bootstrap-sass'
gem 'coveralls', require: false
gem 'docsplit-paperclip-processor', '~> 0.2.4', github: 'zzeroo/docsplit-paperclip-processor'
gem 'faker'
gem 'font-awesome-sass'
gem 'jbuilder'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'leaflet-rails'
gem 'paperclip', '~> 5.2.0'
gem 'pg'
gem 'piwik_analytics'
gem 'progress_bar'  # fancy progress bar for sunspot solr index
gem 'rails-env-favicon'
gem 'rb-readline'
gem 'roo'
gem 'sass-rails'
gem 'simple_form'
gem 'sunspot_rails'
gem 'turbolinks'
gem 'unicorn'
gem 'will_paginate-bootstrap'
gem 'will_paginate'
gem "therubyracer"

group :development, :test do
  gem 'foreman'
  gem 'guard-rspec'
  gem 'ruby-prof'
  gem 'rspec-rails'
  gem 'guard-livereload', require: false
  gem 'forgery'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'shoulda-matchers', :github => 'thoughtbot/shoulda-matchers'
  gem 'sunspot_solr'
end

group :development do
  gem 'rails-erd'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'spring'
  gem 'ruby-graphviz'
  gem 'yard'
  gem 'launchy'
  gem 'guard-cucumber'
end

group :development, :test do
  gem "factory_bot_rails"
  # or
  gem "factory_bot"
end

group :test do
  gem 'selenium-webdriver'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment these lines on Linux.
  gem 'libnotify'
end

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end
