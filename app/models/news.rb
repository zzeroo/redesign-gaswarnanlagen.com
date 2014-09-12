# News, firm interna and infos about our firm
class News < ActiveRecord::Base
  has_attached_file  :news_image, {
                      :styles => { medium: "300x300",
                                 thump: "100x100"},
                      default_url: "/images/:style/missing.png"
                    }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates_attachment_content_type :news_image, :content_type => /\Aimage\/.*\Z/
end
