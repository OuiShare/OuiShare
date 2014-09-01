class AdvisorsPage < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language

  beautiful_text_for [:text]
end
