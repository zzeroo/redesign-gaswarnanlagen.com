class AddAdditionalColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :short_text1, :text
    add_column :products, :short_text2, :text
    add_column :products, :technical_data, :text
    add_column :products, :has_ast, :boolean
  end
end
