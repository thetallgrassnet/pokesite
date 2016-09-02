class EditorImageUploader < CarrierWave::Uploader::Base
  include Imageable

  version :large do
    process resize_to_limit: [850, nil]
  end

  version :medium do
    process resize_to_limit: [640, nil]
  end

  version :small do
    process resize_to_limit: [320, nil]
  end
end
