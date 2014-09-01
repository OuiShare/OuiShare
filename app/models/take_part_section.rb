class TakePartSection < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  beautiful_text_for [:main_text, :text1, :text2, :text3]
end
