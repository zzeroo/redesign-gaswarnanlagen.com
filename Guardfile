# More info at https://github.com/guard/guard#readme

require 'active_support/inflector'

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  notification :libnotify, :timeout => 1, :transient => true, :append => true, :urgency => :low
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', all_after_pass: false, cli: '--drb' do
  notification :libnotify, :timeout => 1, :transient => true, :append => true, :urgency => :low
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end

# guard :test do
#   notification :libnotify, :timeout => 1, :transient => true, :append => true, :urgency => :low
# 
#   watch(%r{^test/.+_test\.rb$})
#   watch('test/test_helper.rb')  { 'test' }
# 
#   # Non-rails
#   #watch(%r{^lib/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
# 
#   # Rails 4
#   watch(%r{^app/(.+)\.rb})                               { |m| "test/#{m[1]}_test.rb" }
#   watch(%r{^app/controllers/application_controller\.rb}) { 'test/controllers' }
#   watch(%r{^app/controllers/(.+)_controller\.rb})        { |m| "test/integration/#{m[1]}_test.rb" }
#   watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
#   watch(%r{^lib/(.+)\.rb})                               { |m| "test/lib/#{m[1]}_test.rb" }
# 
#   # Rails < 4
#   # watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
#   # watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
#   # watch(%r{^app/views/(.+)/.+\.erb$})                { |m| "test/functional/#{m[1]}_controller_test.rb" }
#   # watch(%r{^app/views/.+$})                          { 'test/integration' }
#   # watch('app/controllers/application_controller.rb') { ['test/functional', 'test/integration'] }
# end
