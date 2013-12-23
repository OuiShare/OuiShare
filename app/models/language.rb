class Language < ActiveRecord::Base
  has_one :top_banner
  has_one :what_is_section
  has_one :hot_projects_section
  has_one :events_section
  has_one :take_part_section
  has_one :partner
  has_one :about
  has_one :articles_section
  has_one :community_page
  has_one :mission
  has_one :governance_page
  has_one :value_page
  has_one :timeline
  has_one :faq_page
  has_one :team_page
  has_one :advisors_page
  has_one :cocreation_page
  has_many :projects
  has_many :events
  has_many :activities
  has_many :governances
  has_many :values
  has_many :faq_questions
  has_many :communities
  has_many :cocreations

  validates :name, :english_name, :slug, presence: true

  scope :visible, ->{ where(visible: true) }
end
