class DocumentsRenameColumnBodyToTitle < ActiveRecord::Migration
  def change
    rename_column :documents, :body, :desc
  end
end
