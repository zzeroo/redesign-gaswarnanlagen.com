class AddLogoToCategory < ActiveRecord::Migration[5.0]
  def change
    add_attachment :categories, :logo
  end
end
