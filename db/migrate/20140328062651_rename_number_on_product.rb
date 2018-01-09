class RenameNumberOnProduct < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :number, :product_nr
  end
end
