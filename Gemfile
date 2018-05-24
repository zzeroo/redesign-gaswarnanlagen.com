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

gem 'bcrypt-ruby'
gem 'faker'
gem 'bootstrap-sass'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'pg'
gem "therubyracer"
gem 'sass-rails'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jquery-fileupload-rails'
gem 'jbuilder'
gem 'unicorn'
gem 'roo'
gem 'paperclip', '~> 5.2.0'
gem 'docsplit-paperclip-processor', '~> 0.2.4', github: 'zzeroo/docsplit-paperclip-processor'
gem 'aws-sdk'
gem 'sunspot_rails'
gem 'progress_bar'  # fancy progress bar for sunspot solr index
gem 'simple_form'
gem 'leaflet-rails'
# gem 'piwik_analytics', '~> 1.0.6', :git => 'https://github.com/zzeroo/piwik_analytics.git'
gem 'piwik_analytics'
gem 'rb-readline'
gem 'coveralls', require: false
gem 'rails-env-favicon'

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
