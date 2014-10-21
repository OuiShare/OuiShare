class AboutController < ApplicationController
  include AutoHtml
  def index
    @about = @current_language.about || About.new
  end

  def mission
    @resource = @current_language.mission || Mission.new
    @list = @current_language.activities.rank(:row_order) || [Activity.new]
  end

  def vision
  end

  def history
    @timeline = @current_language.timeline || Timeline.new
  end

  def organization
    @organization_page = @current_language.organization_page || OrganizationPage.new
  end

  def collaborative_economy
    @collaborative_economy_page = @current_language.collaborative_economy_page || CollaborativeEconomyPage.new
  end

  def team
    @users = User.connectors.order('created_at')
    @team_page = @current_language.team_page || TeamPage.new
  end

  def advisory
    @users = User.advisors.order('created_at')
    @advisors_page = @current_language.advisors_page || AdvisorsPage.new
  end

  def governance
    @resource = @current_language.governance_page || GovernancePage.new
    @list = @current_language.governances || [Governance.new]
  end

  def value
    @resource = @current_language.value_page || ValuePage.new
    @list = @current_language.values || [Value.new]
  end

  def funded
    @resource = @current_language.funded_page || FundedPage.new
    @list = @current_language.funding_infos.order('created_at desc') || [FundingInfo.new]
  end

  def users
    @users = User.where(profile_type: "user")
    # @users_page = @current_language.users_page || UsersPage.new
  end

end
