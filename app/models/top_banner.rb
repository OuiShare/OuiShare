class TopBanner < ActiveRecord::Base
  belongs_to :language
  validates :title1, :text1, :title2, :text2, presence: true

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
end
