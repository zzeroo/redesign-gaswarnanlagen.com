class CreateBdas < ActiveRecord::Migration[5.0]
  def change
    create_table :bdas do |t|
      t.string :name, :product_nr_prefix
      t.text :description

      t.timestamps
    end
  end
end
