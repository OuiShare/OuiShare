class DonationPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

  beautiful_text_for [:main_text, :thanks_text, :text1, :text2]
end

