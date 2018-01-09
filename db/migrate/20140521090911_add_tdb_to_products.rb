class AddTdbToProducts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :tdb
  end
end
