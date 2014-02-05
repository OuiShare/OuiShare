class ResearchPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  mount_uploader :image, ImageUploader

  beautiful_text_for [:main_text]

  def text
    main_text
  end
end
