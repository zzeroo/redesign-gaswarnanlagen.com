class RenameNumberOnProduct < ActiveRecord::Migration
  def change
    rename_column :products, :number, :product_nr
  end
end
