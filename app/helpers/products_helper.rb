module ProductsHelper

  # Helper to construct the short_description 
  def show_short_description(product, search)
    if product.short_text1.blank?
      truncate((highlight_it product.short_description, search), :length => 60)
    else
      truncate((highlight_it product.short_text2, search), :length => 60)
    end
  end

  # Helper to construct the short_description 
  def show_description(product, search)
    if product.short_text2.blank?
      truncate((highlight_it product.description, search), :length => 160)
    else
      truncate((highlight_it product.short_text2, search), :length => 160)
    end
  end

end
