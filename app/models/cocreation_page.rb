class CocreationPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image, ImageUploader
  beautiful_text_for [:text]
end
