class WhatIsSection < ActiveRecord::Base
  belongs_to :language
  validates :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, :image1, :image2, :image3, :image4, presence: true

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
end
