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

  version :project_thumb, :if => :is_project? do
    process :resize_to_fill => [300, 180]
  end

  version :event_thumb, :if => :is_event? do
    process :resize_to_fill => [300, 180]
  end

  protected
  def is_top_banner? picture
    model.kind_of?(TopBanner)
  end

  def is_project? picture
    model.kind_of?(Project)
  end

  def is_event? picture
    model.kind_of?(Event)
  end

end
