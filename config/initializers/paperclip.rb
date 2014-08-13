Paperclip.interpolates(:s3_eu_url) { |attachment, style|
  "#{attachment.s3_protocol}://s3-eu-west-1.amazonaws.com/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
}
require 'aws/s3'
AWS::S3::DEFAULT_HOST.replace "s3-eu-west-1.amazonaws.com"
