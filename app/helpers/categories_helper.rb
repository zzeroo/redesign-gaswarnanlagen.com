module CategoriesHelper
  def categories_for_select
    # category| [category.name + "   '" + truncate(category.description, :length => 30) + "'", category.id, category.children.empty? ? "" : {class: 'bold'}] }

    Category.all.order(:created_at).collect do |c|
      [
       c.parent.blank? ? c.name : c.name + "   '" + truncate(c.description, :length => 30) + "'", 
       c.id, 
       c.parent.blank? ? {class: 'bold'} : "" 
      ]
    end
  end
end
