class AddLogoToCategory < ActiveRecord::Migration
  def change
    add_attachment :categories, :logo
  end
end
