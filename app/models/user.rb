class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, dependent: :destroy
  validates :name, presence: true
  before_validation do
    add_url_protocol_to(['facebook_url', 'twitter_url', 'google_plus_url', 'github_url', 'linkedin_url'])
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session[:omniauth]
        user.email = auth.info.email if auth.info.email.present?
        user.name = auth.info.name
        user.image = auth.info.image
        user.authorizations.build(provider: auth.provider, uid: auth.uid)
      end
    end
  end

  def avatar_url(size = 100)
    return image if image.present?
    "http://gravatar.com/avatar/#{Digest::MD5.new.update(email)}.jpg?s=#{size}"
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
