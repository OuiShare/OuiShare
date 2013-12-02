class HomeController < ApplicationController
  require 'feedzirra'
  def index
    #@feed = Feedzirra::Feed.fetch_and_parse('http://ouishare.net/feed')

    @language = Language.where(slug: I18n.locale.to_s).first
    @top_banner = @language.top_banner || TopBanner.new
    @what_is_section = @language.what_is_section || WhatIsSection.new
    @hot_projects_section = @language.hot_projects_section || HotProjectsSection.new
    @events_section = @language.events_section || EventsSection.new
    @take_part_section = @language.take_part_section || TakePartSection.new
  end
end
