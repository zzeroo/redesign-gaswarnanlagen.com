class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :number
      t.string :description
      t.text :short_description

      t.timestamps
    end
  end
end
