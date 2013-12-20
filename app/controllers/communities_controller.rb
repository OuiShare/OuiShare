class CommunitiesController < ApplicationController
  def index
    @community_page = @current_language.community_page || CommunityPage.new
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
