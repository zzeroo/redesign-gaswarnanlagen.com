class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :news_body

      t.timestamps
    end
  end
end
