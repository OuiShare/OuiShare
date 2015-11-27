class AboutController < ApplicationController
  include AutoHtml

  helper_method :clean_description
  
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
    @users = User.where(:profile_type => 1).order('fname').order('name').order('show_order asc')
    @team_page = @current_language.team_page || TeamPage.new
  end

  def advisory
    @users = User.where(:profile_type => 2).order('name')
    @advisors_page = @current_language.advisors_page || AdvisorsPage.new
  end

  def alumni
    @users = User.where(:profile_type => 4).order('name')
    @alumni_page = @current_language.alumni_page || TeamPage.new
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
    # @users = User.where(:profile_type => [1, 0]).paginate(:page => params[:page]).order('id DESC')
    @users, @alphaParams = User.all.alpha_paginate(params[:letter], {:default_field => "a", :include_all => false}){|user| user.name}
    @users_page = @current_language.users_page || UsersPage.new
  end

end
