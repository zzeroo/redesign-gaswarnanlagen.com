class AddLogoAttachmentToProductGroups < ActiveRecord::Migration
  def change
    add_attachment :product_groups, :logo
  end
end
