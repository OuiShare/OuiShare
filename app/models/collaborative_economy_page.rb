class CollaborativeEconomyPage < ActiveRecord::Base
  belongs_to :language
  include Shared::BeautifulText

  mount_uploader :image, ImageUploader

  beautiful_text_for [:main_text, :text1]
end
