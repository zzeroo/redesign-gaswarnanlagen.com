class Product < ActiveRecord::Base
  belongs_to :product_group
  default_scope { order('number') }

  validates :product_group_id, presence: true
  validates :number, presence: true
  validates :description, presence: true
end
