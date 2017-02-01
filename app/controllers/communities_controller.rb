class CommunitiesController < ApplicationController
  include AutoHtml

  before_action :set_community, :only => [:show, :join, :leave]
  before_action :authenticate_user!, :only => [:join, :leave]
  helper_method :clean_description

  def index
    language = Language.where(name:'English').first
    @community_page = language.community_page || CommunityPage.new
    @communities = language.communities
    @regions = Region.where(language: language).order(title: :asc)
    @communities_for_select = Community.where(language: language).order(name: :asc)
  end

  def show
    past_events = @current_community.events.visible.over.order('date_start DESC').limit(30).reverse
    @community_events = @current_community.events.visible.next.order('date_start').to_a
    @community_events = @community_events + past_events
  end

  def join_us
    community = Community.friendly.find(params[:community_id])
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
    @communities_for_select = region.communities.order(:name).map{|a| [a.id, a.name]}
    respond_to do |format|
      format.json { render json: @communities_for_select.to_json}
    end
  end

  def get_communities_partial
    region = Region.find(params[:region_id_2])
    # map to name and id for use in our options_for_select
    communities = region.communities.order(:name)
    render partial: 'communities/communities', locals:{communities: communities, region: region}
  end

  def get_community_partial
    community = Community.friendly.find(params[:community_id])
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
    # @current_community = Community.find(params[:id])
    @current_community = Community.friendly.find(params[:id])
  end

  def community_params
  end
end
