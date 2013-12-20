class Event < ActiveRecord::Base
  belongs_to :language

  mount_uploader :image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader

  acts_as_taggable

  scope :visible, ->{ where(visible: true) }

  def name
    title
  end

  def cta
    "#{place} / #{date} / #{time.strftime('%H:%M')}"
  end
end
