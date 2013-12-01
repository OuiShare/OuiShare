class HomeController < ApplicationController
  require 'feedzirra'
  def index
    #@feed = Feedzirra::Feed.fetch_and_parse('http://ouishare.net/feed')

    @language = Language.where(slug: I18n.locale.to_s).first
    @top_banner = @language.top_banner
    @what_is_section = @language.what_is_section
    @hot_projects_section = @language.hot_projects_section
  end
end
