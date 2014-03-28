class RenamePublicOnProductGroups < ActiveRecord::Migration
  def change
    rename_column :product_groups, :public, :published
  end
end
