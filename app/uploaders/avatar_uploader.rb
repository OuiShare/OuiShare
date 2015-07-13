# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    "/images/default_avatar.png"
  end

  version :normal do
    process :resize_to_fill => [140, 140]
  end

  version :avatar do
    process :resize_to_fill => [220, 220]
  end

  version :small do
    process :resize_to_fill => [50, 50]
  end

end

