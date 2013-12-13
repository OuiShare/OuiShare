class Language < ActiveRecord::Base
  has_one :top_banner
  has_one :what_is_section
  has_one :hot_projects_section
  has_one :events_section
  has_one :take_part_section
  has_one :partner
  has_one :about
  has_many :projects
  has_many :events

  validates :name, :english_name, :slug, presence: true
end
