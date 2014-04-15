class ProductGroup < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  has_attached_file :logo, :default_url => "images/rails.png"
  validates_attachment :logo, :size => { :in => 0..2.megabytes }
  validates_attachment_content_type :logo, :content_type => /\Aimage/

  validates :name, presence: true
  #validates :product_nr_prefix, presence: true

  def products
    #Product.where(product_nr: self.product_nr_prefix.split(",").collect{|p| p + "%"})
    Product.where("product_nr ~* ?", self.product_nr_prefix.split(',').collect{|p| "^" + p}.join('|'))
  end
end
