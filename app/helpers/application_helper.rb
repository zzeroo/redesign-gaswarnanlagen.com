# Application Helper
module ApplicationHelper
  # Return the full title on a per-page basis.
  def full_title(page_title)
    base_title = "RA-GAS GmbH"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Set the bootstrap class for message boxes
  # TODO: studdy this deeper
  def bootstrap_class_for(flash_type)
    # {success: 'alert-success',...}[flash_type] || flash_type.to_s
    case flash_type
    when :success
      "alert-success"
    when :error
      "alert-error"
    when :alert
      "alert-block"
    when :notice
      "alert-info"
    else
      flash_type.to_s
    end
  end

  # Highlight the sunspot_solr search results
  def highlight_it(what, with)
    what = what.nil? ? "" : what
    with = with.nil? ? "" : with
    return highlight what, with
  end

end
