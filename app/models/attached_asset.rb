# Attached Assets
# Meta Model for attachments
class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  has_attached_file :asset, {
                      styles: {
                        thumbnail: "60x60#",
                        small: "x100",
                        medium: "300x300",
                        big: "800x800"
                      }
                    }.merge(PAPERCLIP_STORAGE_OPTIONS)

  do_not_validate_attachment_file_type :asset

  before_post_process :skip_for_documents

  private
    # Skip some documents
    # FIXME: Learn more about
    # FIXME: Is this working?
    def skip_for_documents
      ! %w(
        .xlsx   application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
        .xltx   application/vnd.openxmlformats-officedocument.spreadsheetml.template
        .potx   application/vnd.openxmlformats-officedocument.presentationml.template
        .ppsx   application/vnd.openxmlformats-officedocument.presentationml.slideshow
        .pptx   application/vnd.openxmlformats-officedocument.presentationml.presentation
        .sldx   application/vnd.openxmlformats-officedocument.presentationml.slide
        .docx   application/vnd.openxmlformats-officedocument.wordprocessingml.document
        .dotx   application/vnd.openxmlformats-officedocument.wordprocessingml.template
        ).include?(asset_content_type)
    end
end
