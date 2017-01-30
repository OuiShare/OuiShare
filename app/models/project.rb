class Project < ActiveRecord::Base
  include Shared::BeautifulText

  belongs_to :language
  has_and_belongs_to_many :users
  has_and_belongs_to_many :communities

  include RankedModel
  ranks :row_order

  beautiful_text_for [:resume, :info, :join_us_text, :text1, :text2]

  mount_uploader :image, ImageUploader
  mount_uploader :home_image, ImageUploader
  mount_uploader :service1_image, ImageUploader
  mount_uploader :service2_image, ImageUploader
  mount_uploader :service3_image, ImageUploader

  acts_as_taggable

  scope :visible, ->{ where(visible: true) }
  scope :visible_on_menu, ->{ where(display_on_menu: true) }
  scope :featured, ->{ where(featured: true).order('created_at desc').limit(3) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history, :finders]
  
  def slug_candidates
    [
      :name,
      [:name, :id],
    ]
  end

  def featured?
    featured
  end

  def name_with_date
    "#{self.name} | #{self.language.name}"
  end
end
