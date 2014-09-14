# Our Products
class Product < ActiveRecord::Base
  # Configuration for sunspot_solr search
  # TODO: Read more about sunspot_solr search, and results.
  searchable do
    text :product_nr, boost: 5
    text :description, :short_description, :short_text1, :short_text2, :technical_data
  end

  default_scope { order(product_nr: :asc) }

  has_attached_file :logo, {
                      styles: { small: "x30" } }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates_attachment :logo, :size => { :in => 0..2.megabytes }
  validates_attachment_content_type :logo, :content_type => /\Aimage/

  has_attached_file :tdb, {
                        :styles => {
                          :pdf => {
                            :format => "pdf",
                            :processors => [:docsplit_pdf]
                          }
                        }
                    }.merge(PAPERCLIP_STORAGE_OPTIONS)


  validates :product_nr, presence: true, uniqueness: true
  # validates :description, presence: true

  # Dumps the model as CSV
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  # Create a spreadsheet from model attributes.
  # TODO: Can ths be moved to private?
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      parameters = ActionController::Parameters.new(row.to_hash)
      product.update(parameters.permit(:id, :product_nr, :description, :short_description, :created_at, :updated_at, :product_group_id))
      product.save!
    end
  end

  # Opens the attachment and select the work function based on the file name of the uploaded file.
  # TODO: Can ths be moved to private?
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path, { packed: nil, file_warning: :ignore })
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unbekannter Datei Typ: #{file.original_filename}"
    end
  end

  # Liste mit allen BDAs
  # Alle BDA werden durchlaufen, anschließend wird geprüft ob das Product (self)
  # in der Liste der Producte ist
  # FIXME: Bda.all ist viiiiel zu verbose. Hier muss dringend ein index rein!!!1
  def bdas
    ret = []
    Bda.all.each do |bda|
      ret << bda if bda.products.present? and bda.products.include?(self)
    end
    return ret
  end

  # Liste aller Categories die dieses Produkt enthalten
  def categories
    ret = []
    Category.all.each do |cat|
      unless cat.product_nr_prefix.blank?
        product_nrs = cat.product_nr_prefix.split(',').collect{ |x| x.strip }
        product_nrs.each{ |nr| ret << cat unless(self.product_nr =~ Regexp.new(nr)) }
      end
    end
    return ret
  end

end
