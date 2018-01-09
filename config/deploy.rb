# config valid only for Capistrano 3.1
lock '~> 3.10.0'

set :application, 'gaswarnanlagen.com'
set :repo_url, 'git@github.com:zzeroo/redesign-gaswarnanlagen.com.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/gaswarnanlagen.com'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}
set :linked_files, %w{
                      config/database.yml
                      config/s3_credentials.yml
                      }

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :keep_releases, 5

## Username Password ask dynamic
# set(:user) do
#    Capistrano::CLI.ui.ask "Give me a ssh user: "
# end
#
# set(:scm_passphrase) do
#    Capistrano::CLI.ui.ask "Git scm passphrase: "
# end
set :ssh_options, { :forward_agent => true }
# set :user, "gaswarnanlagen"

# set :rails_env, "production"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism h   ,     exampl:mple.com", :app, :web, :db, :primary => true"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
