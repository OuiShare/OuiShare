class Community < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language
  belongs_to :region
  has_and_belongs_to_many :users
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :events
  has_many :community_members
  has_many :members, -> { uniq }, through: :community_members, source: :user

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # has_many :connectors
  # has_many :users, through: :connectors
  # has_many :communities_users
  #has_many :users, through: :communities_users
 
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  def slug_candidates
    [
      :name,
      [:name, :region_id],
      [:name, :region_id, :id],
    ]
  end
  mount_uploader :main_image, ImageUploader


  include RankedModel
  ranks :row_order
  beautiful_text_for [:text]

  scope :without_region, ->{ where(region_id: nil) }

end
