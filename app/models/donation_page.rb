class DonationPage < ActiveRecord::Base
  belongs_to :language

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
end

