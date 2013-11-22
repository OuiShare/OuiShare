class Language < ActiveRecord::Base
  has_one :top_banner
  has_one :what_is_section

  validates :name, :english_name, :slug, presence: true
end
