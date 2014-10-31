class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  extend Enumerize
  include Shared::BeautifulText

  validates :terms_of_service, acceptance: true
  has_many :authorizations, dependent: :destroy
  has_and_belongs_to_many :events
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :expert_groups
  has_and_belongs_to_many :topics
  belongs_to :language
  belongs_to :occupation
  belongs_to :user_source
  has_and_belongs_to_many :sectors

  validates :fname, :name, :language, :country, :gender, :city, :occupation, presence: true
  validates_inclusion_of :gender, :in => 0..2

  before_validation do
    add_url_protocol_to(['facebook_url', 'twitter_url', 'google_plus_url', 'github_url', 'linkedin_url'])
  end

  mount_uploader :image, AvatarUploader
  validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 1.megabytes.to_i 
    } 

  acts_as_taggable

  beautiful_text_for [:bio]

  enumerize :profile_type, in: { user: 0, connector: 1, advisor: 2, editor: 3, alumni_connector: 4 }

  scope :connectors,  lambda{('profile_type => 1')}
  scope :advisors, lambda{('profile_type = 2')}

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session[:omniauth]
        user.email = auth.info.email if auth.info.email.present?
        user.name = auth.info.name
        user.remote_image_url = auth.info.image
        user.authorizations.build(provider: auth.provider, uid: auth.uid)
      end
    end
  end

  def update_image(url)
    unless self.image.present?
      self.remote_image_url = url if url.present?
      self.save!
    end
  end

  def avatar_url(size = 200)
    if size < 100
      return image.small if image.present?
    elsif size < 150
      return image.normal if image.present?
    else
      return image if image.present?
    end
    "http://gravatar.com/avatar/#{Digest::MD5.new.update(email)}.jpg?s=#{size}"
  end

  def has_edit_rights?
    [1, 2, 3].include?(self.profile_type_value) || self.admin?
  end

  def is_admin?
    self.admin? || self.profile_type == 1
  end

  protected
  def add_url_protocol_to(field)
    if field.kind_of?(Array)
      field.each { |f| add_url_protocol_to(f) }
    else
      if self.send(field).present?
        self.send("#{field}=", "http://#{self.send(field)}") unless self.send(field)[/\Ahttp:\/\//] || self.send(field)[/\Ahttps:\/\//]
      end
    end
  end
end
