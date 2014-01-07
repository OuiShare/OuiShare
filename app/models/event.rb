class Event < ActiveRecord::Base
  extend FriendlyId
  belongs_to :language
  has_and_belongs_to_many :users

  friendly_id :title, use: [:slugged, :history, :finders]

  mount_uploader :image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader

  acts_as_taggable

  scope :visible, ->{ where(visible: true) }
  scope :next, ->{ where('date_start > ?', Time.now) }

  def name
    title
  end

  def cta
    if date_end.present? && date_end != date_start
      "#{place} | #{date_start.strftime('%d/%m/%Y')} to #{date_end.strftime('%d/%m/%Y')} | #{time.strftime('%H:%M')}"
    else
      "#{place} | #{date_start} | #{time.strftime('%H:%M')}"
    end
  end
end
