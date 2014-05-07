class AddNewsImageToNews < ActiveRecord::Migration
  def change
    add_attachment :news, :news_image
  end
end
