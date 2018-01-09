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

    validates_attachment_content_type :asset, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

end
