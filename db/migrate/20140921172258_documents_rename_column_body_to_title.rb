class DocumentsRenameColumnBodyToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :documents, :body, :desc
  end
end
