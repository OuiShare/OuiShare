class Testimonial < ActiveRecord::Base
  belongs_to :language

  mount_uploader :user_picture1, ImageUploader
  mount_uploader :user_picture2, ImageUploader
  mount_uploader :user_picture3, ImageUploader
  mount_uploader :user_picture4, ImageUploader

end
