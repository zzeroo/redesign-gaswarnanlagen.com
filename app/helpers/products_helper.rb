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

  # Helper für das richtige Symbol, abhänig vom Datei Typ: attachable_type
  # TODO: Optionen mit Options Hash gestalten
  def icon_link_to( a, link_title = "Download", style = "", css_class = 'fa-2x' )
    case a.asset.content_type
    when "application/pdf"
      icon_file = 'file-pdf-o'
      link_title = link_title + ' PDF'
      # TODO: Style nur setzen wenn nicht im options Hash vorhanden
      style = "color: darkred"
    when "application/vnd.openxmlformats-officedocument.wordprocessingml.document" 
      icon_file = 'file-word-o'
      link_title = link_title + ' DOCX'
      # TODO: Style nur setzen wenn nicht im options Hash vorhanden
      style = "color: blue"
    else
      icon_file = 'file-text'
    end

    link_to( icon( icon_file, '', class: css_class, title: link_title, style: style ), a.asset.url ) 
  end
end