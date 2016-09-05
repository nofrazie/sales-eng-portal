if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJVMN4KEYITYBKGEQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['sales-eng-app']
  end
end
