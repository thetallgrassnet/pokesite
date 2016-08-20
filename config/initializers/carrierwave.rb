require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env.test?
    config.enable_processing = false
  end

  if Rails.env.production?
    config.asset_host = "https://#{ENVied.AWS_S3_BUCKET}"
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENVied.AWS_ACCESS_KEY_ID,
      aws_secret_access_key: ENVied.AWS_SECRET_ACCESS_KEY,
      region: ENVied.AWS_REGION
    }
    config.fog_directory = ENVied.AWS_S3_BUCKET
  else
    config.storage = :file
  end
end
