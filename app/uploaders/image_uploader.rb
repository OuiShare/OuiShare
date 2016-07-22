# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
   process :resize_to_fit => [70, 70]
  end

  version :top_banner, :if => :is_top_banner? do
    process :resize_to_fill => [1920, 905]
  end

  version :project_thumb, :if => :is_project? do
    process :resize_to_fit => [540, 300]
  end

  version :project_page_thumb, :if => :is_project? do
    process :resize_to_fit => [800, 500]
  end

  version :home_thumb, :if => :has_home_thumb? do
    process :resize_to_fit => [540, 300]
  end

  version :event_page_thumb, :if => :is_event? do
    process :resize_to_fit => [800, 500]
  end

  version :event_thumb, :if => :is_event? do
    process :resize_to_fit => [540, 300]
  end

  version :top_image, :if => :has_top_image? do
    process :resize_to_fill => [970, 330]
  end

  version :list_thumb, :if => :has_list_thumb? do
    process :resize_to_fill => [550, 250]
  end

  version :partner, :inf => :is_partner? do
    process :resize_to_fit => [115, 115]
  end

  version :top_internal, :if => :has_top_internal? do
    process :resize_to_fill => [1800, 480]
  end

  version :donation, :if => :is_donation_page? do
    process :resize_to_fill => [600, 230]
  end

  version :testimonial_avatar, :if => :is_testimonial? do
    process :resize_to_fill => [60, 60]
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

  def is_donation_page? picture
    model.kind_of?(DonationPage)
  end

  def is_testimonial? picture
    model.kind_of?(Testimonial)
  end

  def has_top_image? picture
    ['Project', 'Event'].include?(model.class.name)
  end

  def has_list_thumb? picture
    ['Project', 'Event', 'Activity', 'FundingInfo', 'Research', 'Service', 'Cocreation'].include?(model.class.name)
  end

  def is_partner? picture
    model.kind_of?(Partner)
  end

  def has_top_internal? picture
    ['Mission', 'GovernancePage', 'ValuePage', 'FaqPage', 'CommunityPage',
     'CocreationPage', 'ExpertGroupsPage', 'GetInvolvedPage', 'OrganizationPage',
     'LivePage', 'PressRoomPage', 'FundedPage', 'ResearchPage',
     'WorkusPage', 'CollaborativeEconomyPage', 'KnowledgePage'].include?(model.class.name)
  end

  def has_home_thumb? picture
    ['Project', 'Event'].include?(model.class.name)
  end
end
