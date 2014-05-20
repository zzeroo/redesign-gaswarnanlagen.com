class AddLogoToProducts < ActiveRecord::Migration
  def change
    add_attachment :products, :logo
  end
end
