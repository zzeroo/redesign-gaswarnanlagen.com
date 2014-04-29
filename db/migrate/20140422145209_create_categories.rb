class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.boolean :published
      t.string :product_nr_prefix
      t.string :background_color

      t.timestamps
    end
  end
end
