class AddLogoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :logo
  end
end
