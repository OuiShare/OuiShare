# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
   process :resize_to_fit => [70, 70]
  end

  version :top_banner, :if => :is_top_banner? do
    process :resize_to_fill => [1920, 775]
  end

  protected
  def is_top_banner? picture
    model.kind_of?(TopBanner)
  end

end
