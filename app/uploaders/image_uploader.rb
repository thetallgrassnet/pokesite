class ImageUploader < ApplicationUploader
  include CarrierWave::MiniMagick

  process :optimize

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def content_type_whitelist
    /image\//
  end

  def optimize
    manipulate! do |img|
      img.format('jpg') do |c|
        c.strip
        c.quality 80
        c.depth 8
        c.interlace 'plane'
      end
      img
    end
  end

  private

  def file_extension
    'jpg'
  end
end
