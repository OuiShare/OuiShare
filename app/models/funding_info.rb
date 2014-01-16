class FundingInfo < ActiveRecord::Base
  belongs_to :language

  mount_uploader :image, ImageUploader

  def name
    title
  end

  def link
    '#'
  end
end
