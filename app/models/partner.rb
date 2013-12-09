class Partner < ActiveRecord::Base
  belongs_to :language

  mount_uploader :partner1, ImageUploader
  mount_uploader :partner2, ImageUploader
  mount_uploader :partner3, ImageUploader
  mount_uploader :partner4, ImageUploader
  mount_uploader :partner5, ImageUploader
  mount_uploader :partner6, ImageUploader
  mount_uploader :partner7, ImageUploader
end
