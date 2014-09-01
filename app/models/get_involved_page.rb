class GetInvolvedPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image, ImageUploader
  beautiful_text_for [:main_text, :text1, :text2, :text3, :text4, :text5, :text6, :text7]
end
