class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset,
                    :storage => :s3,
                    :s3_credentials => Rails.root.join("config/s3_credentials.yml"),
                    styles: {thumbnail: "60x60#", small: "x100", medium: "300x300", big: "800x800" }

  do_not_validate_attachment_file_type :asset
end
