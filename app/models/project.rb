class Project < ActiveRecord::Base
  extend FriendlyId
  belongs_to :language
  has_and_belongs_to_many :users

  friendly_id :name, use: [:slugged, :history, :finders]

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
