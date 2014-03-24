class Product < ActiveRecord::Base
  belongs_to :product_group
  default_scope { order('number') }

  validates :product_group_id, presence: true
  validates :number, presence: true
  validates :description, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
