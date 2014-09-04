class AddNewsDateToNews < ActiveRecord::Migration
  def change
    add_column :news, :news_date, :datetime
  end
end
