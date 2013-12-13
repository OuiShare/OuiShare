class Project < ActiveRecord::Base
  belongs_to :language

  mount_uploader :image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader
end
