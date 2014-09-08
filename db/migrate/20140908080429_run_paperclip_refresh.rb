class RunPaperclipRefresh < ActiveRecord::Migration
  def change
    Rake::Task['paperclip:refresh:missing_styles'].invoke
  end
end
