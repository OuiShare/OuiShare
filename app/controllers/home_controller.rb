class HomeController < ApplicationController
  require 'feedjira'
  include AutoHtml

  def index
    @top_banner = @current_language.top_banner || TopBanner.new
    @what_is_section = @current_language.what_is_section || WhatIsSection.new
    @hot_projects_section = @current_language.hot_projects_section || HotProjectsSection.new
    @events_section = @current_language.events_section || EventsSection.new
    @take_part_section = @current_language.take_part_section || TakePartSection.new
    @articles_section = @current_language.articles_section || ArticlesSection.new
    @partner = @current_language.partner || Partner.new
    @magazines = Magazine.fetch_last_posts(@current_language.slug) rescue []

    #Fetch and order events for slider
    @slider_events = @current_language.events.visible.order('date_start').to_a
    t = []
    @slider_events.each_with_index do |e, index|
      t << @slider_events.delete_at(index) if !e.over?
    end
    @slider_events = t + @slider_events
    
  end

  def terms
    @terms_page = @current_language.terms_page || TermsPage.new
  end
end
