class ResearchPage < ActiveRecord::Base
  belongs_to :language

  mount_uploader :image, ImageUploader

  def text
    main_text
  end
end
