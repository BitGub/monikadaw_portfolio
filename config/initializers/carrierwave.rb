if Rails.env.production?
  CarrierWave.configure do |config|
    
    config.enable_processing = true
    
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: "eu-west-1"
    }
        config.fog_directory = "daw-bucket"
  end
end

if Rails.env.development?

  CarrierWave.configure do |config|
    
    config.enable_processing = true

    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: "eu-west-1"
    }
      config.fog_directory = "daw-dev-bucket"
  end
end