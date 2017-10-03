# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
 include Cloudinary::CarrierWave

   process eager: true  # Force version generation at upload time.

   process convert: 'jpg'

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [314,194]
  end
end
