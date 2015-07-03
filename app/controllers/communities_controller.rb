class CommunitiesController < ApplicationController
  include AutoHtml

  before_action :set_community, :only => [:show, :join, :leave]
  before_action :authenticate_user!, :only => [:join, :leave]
  
  def index
    @community_page = @current_language.community_page || CommunityPage.new
    @communities = @current_language.communities
    @regions = Region.all
    @communities_for_select = Community.all
  end

  def show
    @community_events = @current_community.events.order('date_start').to_a
    t = []
    @community_events.each_with_index do |e, index|
      t << @community_events.delete_at(index) if !e.over?
    end
    @community_events = t + @community_events
  end

  def join_us
    community = Community.find(params[:community_id])
    user = current_user
  end

  def join
    @current_community.members << current_user
    redirect_to :back
  end

  def leave
    @current_community.members.delete(current_user)
    redirect_to :back
  end

  def get_communities_select
    region = Region.find(params[:region_id])
    # map to name and id for use in our options_for_select
    @communities_for_select = region.communities.map{|a| [a.id, a.name]}
    respond_to do |format|
      format.json { render json: @communities_for_select.to_json}
    end
  end

  def get_communities_partial
    region = Region.find(params[:region_id_2])
    # map to name and id for use in our options_for_select
    communities = region.communities.all
    render partial: 'communities/communities', locals:{communities: communities, region: region}
  end

  def get_community_partial
    community = Community.find(params[:community_id])
    users = community.users
    render partial: 'communities/community', locals:{community: community}
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

  private

  def set_community
    @current_community = Community.find(params[:id])
  end

  def community_params
  end
end
