class ProductImport
  include ActiveModel::Model

  attr_accessor :file


  def save
    if imported_products.map(&:valid?).all?
      begin
        imported_products.each(&:save!)
        true
      rescue ActiveRecord::RecordInvalid => invalid
        errors.add :base, invalid.record.errors
        false
      end
    else
      imported_products.each_with_index do |product, index|
        product.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+4}: #{message}"
        end
      end
      false
    end
  end

  def imported_products
    @imported_products ||= load_imported_products
  end

  def load_imported_products
    spreadsheet = open_spreadsheet
    header = translate_attributes( spreadsheet.row(1) )
    # Before we map over all spreadsheet rows we reject that rows which,
    # after we join them to a plain string, have onle emptyness in it's self
    (4..spreadsheet.last_row).reject{|i| spreadsheet.row(i).join.empty? }.map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Product.find_by(product_nr: row["product_nr"]) || Product.new
      product.attributes = row.to_hash.slice(*Product.attribute_names)
      product
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then  Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then  Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  # This function translate the given easyWinArt model attributes
  # to attribute names of the own model
  def translate_attributes(attributes)
    translations = {
      "Artikelnummer"   => "product_nr",
      "Kurzbezeichnung" => "short_description",
      "Langbezeichnung" => "description"
    }

    attributes.map! do |a|
      translations[a].nil? ? a.parameterize.underscore : translations[a]
    end
    return attributes
  end


end
