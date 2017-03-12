module Imageable
  extend ActiveSupport::Concern
  include Uploadable
  include CarrierWave::MiniMagick

  included do
    process :optimize

    version :thumb do
      process resize_to_fit: [200, 200]
    end
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
