class ImageUploader < ApplicationUploader
  include CarrierWave::MiniMagick

  process convert: :jpg

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def content_type_whitelist
    /image\//
  end
end
