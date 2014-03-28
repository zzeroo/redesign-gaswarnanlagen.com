class Product < ActiveRecord::Base

  validates :product_nr, presence: true
  validates :description, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      parameters = ActionController::Parameters.new(row.to_hash)
      product.update(parameters.permit(:id,:product_nr,:description,:short_description,:created_at,:updated_at,:product_group_id))
      product.save!
    end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path, { packed: nil, file_warning: :ignore })
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unbekannter Datei Typ: #{file.original_filename}"
    end
  end
end
