class AddPublicToProductGroup < ActiveRecord::Migration
  def change
    add_column :product_groups, :public, :boolean
  end
end
