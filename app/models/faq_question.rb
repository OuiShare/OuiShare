class FaqQuestion < ActiveRecord::Base
  belongs_to :language

  include RankedModel
  ranks :row_order
end
