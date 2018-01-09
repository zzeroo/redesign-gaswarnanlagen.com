class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
