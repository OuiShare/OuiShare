class CommunitiesController < ApplicationController
  include AutoHtml
  def index
    @community_page = @current_language.community_page || CommunityPage.new
    @communities = @current_language.communities
  end

  def local
  end

  def communities
  end

  def ouishare
  end

  def live
    @live_page = @current_language.live_page || LivePage.new
  end

  def people
  end

  def expert_groups
    @expert_groups_page = @current_language.expert_groups_page || ExpertGroupsPage.new
    @expert_groups = @current_language.expert_groups
  end
end
