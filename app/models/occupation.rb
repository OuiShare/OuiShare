class Occupation < ActiveRecord::Base
  has_many :users
end
