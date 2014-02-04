class CollaborativeEconomyPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image, ImageUploader

  beautiful_text_for [:main_text, :text1]
end
