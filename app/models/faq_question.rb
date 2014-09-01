class FaqQuestion < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  include RankedModel
  ranks :row_order

  beautiful_text_for [:question, :answer]
end
