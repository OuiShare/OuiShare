class Service < ActiveRecord::Base
  include Shared::BeautifulText
  include RankedModel

  belongs_to :language

  ranks :row_order

  mount_uploader :image, ImageUploader
  beautiful_text_for [:text]
end
