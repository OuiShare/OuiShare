class Partner < ActiveRecord::Base
  belongs_to :language

  validates :partner1, :partner2, :partner3, :partner4, :partner5, :partner6, :partner7, :link1, :link2, :link3, :link4, :link5, :link6, :link7, presence: true

  mount_uploader :partner1, ImageUploader
  mount_uploader :partner2, ImageUploader
  mount_uploader :partner3, ImageUploader
  mount_uploader :partner4, ImageUploader
  mount_uploader :partner5, ImageUploader
  mount_uploader :partner6, ImageUploader
  mount_uploader :partner7, ImageUploader
end
