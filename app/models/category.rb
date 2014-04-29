class Category < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  has_attached_file :logo, :default_url => "rails.png"
  validates_attachment :logo, :size => { :in => 0..2.megabytes }
  validates_attachment_content_type :logo, :content_type => /\Aimage/

  validates :name, presence: true
  #validates :product_nr_prefix, presence: true

  validates :background_color, format: { with: /(\A\z|\A#[0-9a-fA-F]{3}\z|\A#[0-9a-fA-F]{6}\z)/ }

  def products
    #Product.where(product_nr: self.product_nr_prefix.split(",").collect{|p| p + "%"})
    Product.where("product_nr ~* ?", self.product_nr_prefix.split(',').collect{|p| "^" + p}.join('|'))
  end
end
