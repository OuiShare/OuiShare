class Research < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  include RankedModel
  ranks :row_order

  acts_as_taggable

  mount_uploader :image, ImageUploader

  beautiful_text_for [:text]

  def name
    title
  end
end
