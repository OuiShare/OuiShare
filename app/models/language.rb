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
  has_one :contact_page
  has_one :donation_page
  has_one :get_involved_page
  has_one :expert_groups_page
  has_one :organization_page
  has_one :terms_page
  has_one :live_page
  has_one :press_room_page
  has_one :funded_page
  has_one :research_page
  has_one :workus_page
  has_one :collaborative_economy_page
  has_one :knowledge_page
  has_one :testimonial
  has_many :projects
  has_many :events
  has_many :activities
  has_many :governances
  has_many :values
  has_many :faq_questions
  has_many :communities
  has_many :cocreations
  has_many :expert_groups
  has_many :funding_infos
  has_many :researches
  has_many :services
  has_many :regions

  has_many :users
  
  validates :name, :english_name, :slug, presence: true

  scope :visible, ->{ where(visible: true) }
end
