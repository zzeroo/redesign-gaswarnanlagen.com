class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset

  do_not_validate_attachment_file_type :asset
end
