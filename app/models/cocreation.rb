class Cocreation < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  beautiful_text_for [:text]

  mount_uploader :image, ImageUploader
end
