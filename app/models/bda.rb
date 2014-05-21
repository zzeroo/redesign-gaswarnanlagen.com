class Bda < ActiveRecord::Base
  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true #, reject_if: lambda{|attributes| attributes['asset_file_name'].blank? }

  def products
    Product.where("product_nr ~* ?", self.product_nr_prefix.split(',').collect{|p| "^" + p}.join('|')) if self.product_nr_prefix.present?
  end

end
