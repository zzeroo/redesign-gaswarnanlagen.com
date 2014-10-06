# Attached Assets
# Meta Model for attachments
class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  has_attached_file :asset, {
                      styles: lambda { |a|
                        ["image/jpeg", "image/png", "image/jpg", "image/gif", "image/svg"].include?( a.content_type ) ? {
                        thumbnail: "60x60#",
                        small: "x100",
                        medium: "300x300",
                        big: "800x800"
                      } : {
                       pdf: {
                            format: "pdf",
                            processors: [:docsplit_pdf]
                          }
                      }
                      }}.merge(PAPERCLIP_STORAGE_OPTIONS)

  do_not_validate_attachment_file_type :asset

  # Helper method to determine whether or not an attachment is an image.
  # @note Use only if you have a generic asset-type model that can handle different file types.
  def image?
    asset_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end
end
