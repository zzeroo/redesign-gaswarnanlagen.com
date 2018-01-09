class ChangeLimitOnProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :description, :text, :limit => nil
  end
end
