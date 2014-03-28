class AddProductNrPrefixToProductGroup < ActiveRecord::Migration
  def change
    add_column :product_groups, :product_nr_prefix, :string
  end
end
