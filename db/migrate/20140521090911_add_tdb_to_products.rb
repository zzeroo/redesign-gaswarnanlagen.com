class AddTdbToProducts < ActiveRecord::Migration
  def change
    add_attachment :products, :tdb
  end
end
