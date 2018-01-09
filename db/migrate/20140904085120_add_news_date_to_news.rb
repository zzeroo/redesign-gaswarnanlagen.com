class AddNewsDateToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :news_date, :datetime
  end
end
