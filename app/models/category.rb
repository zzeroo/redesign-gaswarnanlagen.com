# Product categories
class Category < ActiveRecord::Base
  has_many :attached_assets, as: :attachable
  accepts_nested_attributes_for :attached_assets, allow_destroy: true # , reject_if: lambda{|attributes| attributes['asset_file_name'].blank? }

  # FIXME: published scope isn't needed anymore
  scope :published, -> { where(published: true) }

  has_attached_file :logo, {
                      styles: {
                        thumbnail: "60x60#",
                        small: "x100",
                        medium: "300x300",
                        big: "800x800"
                      },
                      default_url: "rails.png" }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates :name, presence: true
  validates :background_color, format: { with: /(\A\z|\A#[0-9a-fA-F]{3}\z|\A#[0-9a-fA-F]{6}\z)/ }
  # Validate Category can not children of her self
  validate :parent_not_self
  validates_attachment :logo, :size => { in: 0..2.megabytes }
  validates_attachment_content_type :logo, content_type: /\Aimage/

  # TODO: Enable this
  #before_post_process :check_file_size

  # Neues besseres Join Model 
  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  # Category -> Products Beziehung ist weich, d.h. nicht durch eine echte ActiveRecord Beziehung gestaltet.
  def products
    unless self.product_nr_prefix.nil?
      # Liefert ein Array mit den Product Nummern zurück
      product_nrs = self.product_nr_prefix.split(',').map{ |x| x.strip }

      if self.product_nr_prefix.present?
        # Die where Clausel wird mit den Productnummern zusammengesetzt.
        # Die Product Nummern werden mit '|' gejoint
        # Das sieht dann z.B. so aus: where("product_nr ~ * ?", "^310|^100|^123")
        Product.where( "product_nr ~* ?", product_nrs.map{ |p| "^" + p }.join('|') )
      end
    end
  end

  private

  # Validate before upload
  # https://github.com/thoughtbot/paperclip/wiki/Thumbnail-Generation
  def check_file_size
      valid?
        errors[:logo_file_size].blank?
  end
  # Helper function to check if category is parent of her self
  def parent_not_self
    if parent_id.present? && parent_id == id
      errors.add(:parent_id, :parent_not_self)
    end
  end
end
