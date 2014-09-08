class RunPaperclipRefresh < ActiveRecord::Migration
  def change
    if Rails.env.development? || Rails.env.production? || Rails.env.staging?
      Rake::Task['paperclip:refresh:missing_styles'].invoke
    end
  end
end
