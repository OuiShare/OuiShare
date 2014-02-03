class Region < ActiveRecord::Base
  belongs_to :language
  has_many :communities

  include RankedModel
  ranks :row_order
end
