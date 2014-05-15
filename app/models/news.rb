class News < ActiveRecord::Base
  has_attached_file :news_image,
                    :storage => :s3,
                    :s3_credentials => Rails.root.join("config/s3_credentials.yml"),
                    :styles => { medium: "300x300", thump: "100x100"}, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :news_image, :content_type => /\Aimage\/.*\Z/
end
