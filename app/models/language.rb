class Language < ActiveRecord::Base
  has_one :top_banner
  validates :name, :english_name, :slug, presence: true
end
