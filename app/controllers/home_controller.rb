class HomeController < ApplicationController
  require 'feedzirra'
  include AutoHtml

  def index
    if @current_language.slug == 'en'
      @feed = Feedzirra::Feed.fetch_and_parse('http://ouishare.net/feed')
    else
      @feed = Feedzirra::Feed.fetch_and_parse("http://ouishare.net/#{@current_language.slug}/feed")
    end

    @top_banner = @current_language.top_banner || TopBanner.new
    @what_is_section = @current_language.what_is_section || WhatIsSection.new
    @hot_projects_section = @current_language.hot_projects_section || HotProjectsSection.new
    @events_section = @current_language.events_section || EventsSection.new
    @take_part_section = @current_language.take_part_section || TakePartSection.new
    @articles_section = @current_language.articles_section || ArticlesSection.new
    @partner = @current_language.partner || Partner.new
  end

  def terms
    @terms_page = @current_language.terms_page || TermsPage.new
    @terms_page.text = auto_html(@terms_page.text) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
  end
end
