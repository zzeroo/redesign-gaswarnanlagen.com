source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.1.4'
gem 'rails-i18n', '~> 4.0.0' # For 4.0.x

group :assets do
  gem 'uglifier', '>= 1.0.3'
  gem 'sprockets', '2.11.0' # 2.12.0 is broken
  gem 'sprockets-rails'
  gem 'coffee-rails'
end

gem 'bcrypt-ruby', '3.1.2'
gem 'faker', '1.1.2'
gem 'bootstrap-sass', '~> 3.1.1'#
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'
gem 'pg', '0.15.1'
gem "therubyracer"
gem 'sass-rails', '~> 4.0.2'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'jquery-rails', '3.0.4'
gem 'jquery-ui-rails'
gem 'turbolinks', '1.1.1'
gem 'jquery-turbolinks'
gem 'jbuilder', '1.0.2'
gem 'unicorn'
gem 'roo'
gem 'paperclip'
gem 'docsplit-paperclip-processor', github: 'zzeroo/docsplit-paperclip-processor'
gem 'aws-sdk'
gem 'sunspot_rails'
gem 'progress_bar'  # fancy progress bar for sunspot solr index
gem 'simple_form'
gem 'leaflet-rails'
gem 'piwik_analytics', '~> 1.0.5', :git => 'https://github.com/zzeroo/piwik_analytics.git'
gem 'rb-readline', "~> 0.5.0"
gem 'coveralls', require: false
gem 'rails-env-favicon', '~> 0.0.5'

group :development, :test do
  gem 'guard-rspec'
  gem 'ruby-prof'
  gem 'rspec-rails', '~> 2.14.0.rc1'
  gem 'guard-livereload', require: false
  gem 'forgery'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'shoulda-matchers', :github => 'thoughtbot/shoulda-matchers'
  gem 'sunspot_solr'
end

group :development do
  gem 'rails-erd'
  gem 'capistrano',  '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
  gem 'spring'
  gem 'ruby-graphviz'
  # gem 'yard', "~> 1.0"
  gem 'yard'
  gem 'launchy'
  gem 'guard-cucumber'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment these lines on Linux.
  gem 'libnotify', '0.8.0'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor'
end
