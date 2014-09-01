class Community < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language
  belongs_to :region
  has_and_belongs_to_many :users

  include RankedModel
  ranks :row_order
  beautiful_text_for [:text]

  scope :without_region, ->{ where(region_id: nil) }
end
