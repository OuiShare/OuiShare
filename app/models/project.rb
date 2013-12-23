class Project < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :users

  mount_uploader :image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader

  acts_as_taggable

  scope :visible, ->{ where(visible: true) }
  scope :featured, ->{ where(featured: true).order('created_at desc').limit(2) }

  def featured?
    featured
  end
end
