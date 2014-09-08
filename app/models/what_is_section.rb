class WhatIsSection < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  beautiful_text_for [:text1, :text2, :text3, :text4]

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
end
