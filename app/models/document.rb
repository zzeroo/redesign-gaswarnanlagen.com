# Dokuments
class Document < ActiveRecord::Base
  has_many :attached_assets, as: :attachable
  accepts_nested_attributes_for :attached_assets, allow_destroy: true

  validates :title, presence: true
end
