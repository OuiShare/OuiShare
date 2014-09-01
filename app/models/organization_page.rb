class OrganizationPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image, ImageUploader
  beautiful_text_for [:main_text, :text1, :text2, :text3, :text4]
end
