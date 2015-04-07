# Products Helper
module ProductsHelper

  # Helper to construct the short_description (Kurzbezeichnung)
  #
  # Short_description (interna product description)
  def show_short_description(product, search)
    truncate((highlight_it product.short_description, search), length: 60)
  end

  # Helper to construct the description
  def show_description(product, search)
    if product.short_text2.blank?
      truncate((highlight_it product.description, search), length: 160)
    else
      truncate((highlight_it product.short_text2, search), length: 160)
    end
  end

  # Helper für das richtige Symbol, abhänig vom Datei Typ: attachable_type
  # TODO: Optionen mit Options Hash gestalten
  def icon_link_to(a, **options)
    css_class =  options[:css_class] || 'fa-2x'

    case a.asset.content_type
    when "application/pdf"
      icon_file = 'file-pdf-o'
      title = options[:title] || '' + ' PDF'
      # TODO: Style nur setzen wenn nicht im options Hash vorhanden
      style = "color: darkred"
    when "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      icon_file = 'file-word-o'
      title = options[:title] || '' + ' DOCX'
      # TODO: Style nur setzen wenn nicht im options Hash vorhanden
      style = "color: blue"
    else
      icon_file = 'file-text'
      title =  a.asset.content_type
    end

    link_to(icon(icon_file, '', class: css_class, style: style, title: title), a.asset.url, target: '_blank' )
  end

end
