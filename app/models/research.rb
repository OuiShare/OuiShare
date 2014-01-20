class Research < ActiveRecord::Base
  belongs_to :language

  acts_as_taggable

  mount_uploader :image, ImageUploader

  def name
    title
  end
end
