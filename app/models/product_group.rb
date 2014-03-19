class ProductGroup < ActiveRecord::Base
  validates :name, presence: true
end
