class ClearParentFromCategories < ActiveRecord::Migration
  def change

    Category.all.each do |cat|
      if cat.parent_id == cat.id 
        cat.parent_id = nil
      end
      cat.save!
    end
  end
end
