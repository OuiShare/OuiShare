class CommunitiesController < ApplicationController
  include AutoHtml
  def index
    @community_page = @current_language.community_page || CommunityPage.new
    @community_page.main_text = auto_html(@community_page.main_text) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
    @communities = @current_language.communities
  end

  def local
  end

  def communities
  end

  def ouishare
  end

  def live
  end

  def people
  end
end
