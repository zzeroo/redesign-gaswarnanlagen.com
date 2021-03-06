# lib/tasks/db_pull.rake
# custom task from: https://martinschurig.com/posts/2015/02/pulling-production-database-to-local-machine-rails-task/
namespace :db do
  desc 'Pull production db to development'
  task :pull => [:dump, :restore]

  task :dump do
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'PG_DUMP on production database...'
    production = Rails.application.config.database_configuration['production']
    system "ssh smueller@gaswarnanlagen.com 'PGPASSWORD=\"#{production['password']}\" pg_dump -U gaswarnanlagen #{production['database']} -h #{production['host']} -F t' > #{dumpfile}"
    puts 'Done!'
  end

  task :restore do
    dev = Rails.application.config.database_configuration['development']
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'PG_RESTORE on development database...'
    system "pg_restore --verbose --clean --no-acl --no-owner -h 127.0.0.1 -p #{dev['port']} -U #{dev['username']} -d #{dev['database']} #{dumpfile}"
    puts 'Done!'
  end
end
