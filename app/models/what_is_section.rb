class WhatIsSection < ActiveRecord::Base
  belongs_to :language
  validates :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, presence: true

  include Translatable
end
