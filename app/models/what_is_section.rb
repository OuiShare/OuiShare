class WhatIsSection < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language
  validates :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, :image1, :image2, :image3, :image4, presence: true

  beautiful_text_for [:text1, :text2, :text3, :text4]

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
end
