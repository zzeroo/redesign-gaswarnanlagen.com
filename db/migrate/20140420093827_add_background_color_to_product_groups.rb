class AddBackgroundColorToProductGroups < ActiveRecord::Migration
  def change
    add_column :product_groups, :background_color, :string
  end
end
