class WhatIsSection < ActiveRecord::Base
  belongs_to :language
  validates :mission, :values, :history, :past_projects, presence: true

  include Translatable
end
