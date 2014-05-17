namespace :deploy do
  desc "build missing paperclip styles"
  task :build_missing_paperclip_styles do
    on roles(:app) do
      within release_path do
        with rails_env: "production" do
          execute :bundle, :exec, :rake, :'paperclip:refresh:missing_styles'
        end
      end
    end
  end
end

after("deploy:compile_assets", "deploy:build_missing_paperclip_styles")
