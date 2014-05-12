class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, styles: {thumbnail: "60x60#"}

  do_not_validate_attachment_file_type :asset
end
