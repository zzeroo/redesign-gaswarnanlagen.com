# http://stackoverflow.com/questions/7461985/how-to-seed-the-production-database-using-the-capistrano-gem
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
