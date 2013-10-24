class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, presence: true
  scope :provider, ->(provider) { where(provider: provider).limit(1) }
end
