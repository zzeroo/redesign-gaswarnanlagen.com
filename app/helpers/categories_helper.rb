# Categiries Helper
module CategoriesHelper

  # Konstructs the select field
  def categories_for_select
    @retval = []

    Category.where(parent: nil).collect do |c|
      @retval << make_array(c)

      c.children.each do |child|
        recurs(child)
      end
    end

    return @retval
  end

  private
    
    # Recursive function to itterate over each category child
    def recurs(child)
      @retval << make_array(child)

      return if child.children.blank?

      child.children.each do |subchild|
        recurs(subchild)
      end
    end

    # creates an array with the category name, and it's id.
    #
    # Used in a helper to construct the select field
    def make_array(category)
      [ category_name(category), category.id ]
    end

    # Constructs the category name.
    #
    # Used in a helper to construct the select field
    def category_name(category)
      if category.parent.blank?
        category.name + " [Hauptkategorie]"
      else
        category_name_description(category)
      end
    end

    # Constructs the category description.
    #
    # Used in a helper to construct the select field
    def category_name_description(category)
      if category.description.blank?
        description = ""
      else
        description = "> " + truncate(category.description, :length => 30)
      end
      "..." + category.name + description
    end
end
