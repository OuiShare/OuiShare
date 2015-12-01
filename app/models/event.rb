class Event < ActiveRecord::Base
  include Shared::BeautifulText
  extend FriendlyId
  belongs_to :language
  has_and_belongs_to_many :users
  has_and_belongs_to_many :communities


  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  beautiful_text_for [:resume, :info, :join_us_text, :text1, :text2]

  friendly_id :title, use: [:slugged, :history, :finders]

  mount_uploader :image, ImageUploader
  mount_uploader :home_image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader

  acts_as_taggable

  self.per_page = 10

  scope :over, -> { where('date_end < ?', Time.now) }
  scope :visible, ->{ where(visible: true) }
  scope :visible_on_menu, ->{ where(display_on_menu: true) }
  scope :next, ->{ where('date_end >= ?', Time.now) }

  def over?
    date_end < Time.now
  end

  def name
    title
  end

  def name_with_date_and_language
    "#{self.title} | #{self.date_start} | #{self.language.name}"
  end

  def cta
    if date_end.present? && date_end != date_start
      "#{place} | #{date_start.strftime('%d/%m')} to #{date_end.strftime('%d/%m/%Y')} | #{time.strftime('%H:%M')}"
    else
      "#{place} | #{date_start.strftime('%d/%m/%Y')} | #{time.strftime('%H:%M')}"
    end
  end
end
