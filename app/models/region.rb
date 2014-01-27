class Region < ActiveRecord::Base
  belongs_to :language
  has_many :communities
end
