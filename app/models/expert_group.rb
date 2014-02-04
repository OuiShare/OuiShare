class ExpertGroup < ActiveRecord::Base
  include Shared::BeautifulText
  belongs_to :language
  has_and_belongs_to_many :users

  beautiful_text_for [:text]
end
