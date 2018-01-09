class CreateAttachedAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :attached_assets do |t|
      t.attachment :asset

      t.integer :attachable_id
      t.string  :attachable_type

      t.timestamps
    end
  end
end
