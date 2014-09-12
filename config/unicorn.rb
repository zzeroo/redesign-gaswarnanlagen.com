# config/unicorn.rb
require 'logger'

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true
logger = Logger.new(STDOUT)

before_fork do |server, worker|
  Signal.trap 'TERM' do
    logger.debug 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    logger.debug 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
