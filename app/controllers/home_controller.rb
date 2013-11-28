class HomeController < ApplicationController
  require 'feedzirra'
  def index
    @feed = Feedzirra::Feed.fetch_and_parse('http://ouishare.net/feed')

    @top_banner = TopBanner.by_language(I18n.locale).first
    @what_is_section = WhatIsSection.by_language(I18n.locale).first
  end
end
