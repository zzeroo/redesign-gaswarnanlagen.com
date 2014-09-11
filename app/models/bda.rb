#BDA stands for "Betriebsanleitung" in german
class Bda < ActiveRecord::Base
  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true #, reject_if: lambda{|attributes| attributes['asset_file_name'].blank? }

  # Bdas -> Products Beziehung ist weich, d.h. nicht durch eine echte ActiveRecord Beziehung gestaltet.
  def products
    # Liefert ein Array mit den Product Nummern zurück
    product_nrs = self.product_nr_prefix.split(',').collect{|x| x.strip }

    if self.product_nr_prefix.present?
      # Die where Clausel wird mit den Productnummern zusammengesetzt.
      # Die Product Nummern werden mit '|' gejoint
      # Das sieht dann z.B. so aus: where("product_nr ~ * ?", "^310|^100|^123")
      Product.where("product_nr ~* ?", product_nrs.collect{|p| "^" + p}.join('|'))
    end
  end

end
