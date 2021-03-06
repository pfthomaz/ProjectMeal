CarrierWave.configure do |config|
  # config.fog_credentials = {
  #   provider:               'AWS',
  #   aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
  #   aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
  #   region:                 'us-west-2'
  # }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    #config.root              = "#{Rails.root}/"
    config.root              = "#{Rails.root}/public"
  else
    # config.storage = :fog
    config.storage           = :file
    config.enable_processing = false
    #config.root              = "#{Rails.root}/"
    config.root              = "#{Rails.root}/public"
    #config.root = Rails.root.join('public')
  end

  # config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  # config.fog_directory    = ENV['S3_BUCKET']

  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end