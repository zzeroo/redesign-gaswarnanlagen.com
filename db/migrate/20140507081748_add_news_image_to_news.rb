class AddNewsImageToNews < ActiveRecord::Migration[5.0]
  def change
    add_attachment :news, :news_image
  end
end
