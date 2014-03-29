class ProductGroup < ActiveRecord::Base
  scope :published, -> { where(published: true) }

  validates :name, presence: true
  #validates :product_nr_prefix, presence: true

  def products
    Product.all
  end
end
