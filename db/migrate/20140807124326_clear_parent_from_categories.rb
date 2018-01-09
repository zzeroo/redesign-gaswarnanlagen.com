class ClearParentFromCategories < ActiveRecord::Migration[5.0]
  def change

    Category.all.each do |cat|
      if cat.parent_id == cat.id
        cat.parent_id = nil
      end
      cat.save!
    end
  end
end
