begin
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV['aws.key'],       # required
      :aws_secret_access_key  => ENV['aws.secret'],       # required
      :region                 => 'us-west-2',  # optional, defaults to 'us-east-1'
      :endpoint               => 'ouishare.s3-external-3.amazonaws.com'
    }
    config.fog_directory  = 'ouishare'
  end
rescue Exception => e
  Rails.logger.warn "Error loading settings: #{e}"
end
