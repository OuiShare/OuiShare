class Community < ActiveRecord::Base
  belongs_to :language
  belongs_to :region
  has_and_belongs_to_many :users

  scope :without_region, ->{ where(region_id: nil) }
end
