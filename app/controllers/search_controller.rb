class SearchController < ApplicationController
  before_action :init_search_types

  def search
    @result = {}

    if params[:search]
      @query_tags = parse_tags
      @query_type = params[:search][:type]

      if @query_type and @query_tags.size > 0
        case @query_type
        when 'all'
          @result[:events] = event_search(@query_tags)
          @result[:projects] = project_search(@query_tags)
          @result[:users] = user_search(@query_tags)
        when 'events'
          @result[:events] = event_search(@query_tags)
        when 'projects'
          @result[:projects] = project_search(@query_tags)
        when 'users'
          @result[:users] = user_search(@query_tags)
        end
      end
    end
  end

  def autocomplete_query
    respond_to do |format|
      format.json { render :json => autocomplete_matching_entry() }
    end
  end

  private

  def init_search_types
    @search_types = {
      all: I18n.t('pages.search.types.all'),
      users: I18n.t('pages.search.types.users'),
      events: I18n.t('pages.search.types.events'),
      projects: I18n.t('pages.search.types.projects')
    }
  end

  def parse_tags
    return params[:search][:tags].downcase.split(';') if params[:search][:tags]
    []
  end

  def autocomplete_matching_entry(term = params[:term], type = params[:type])
    result = ActsAsTaggableOn::Tag.ransack(name_cont: term).result(distinct: true).order(:name).map { |tag| tag.name }

    case type
    when 'all'
      result += event_autocompletion(term) + project_autocompletion(term) + user_autocompletion(term)
    when 'events'
      result += event_autocompletion(term)
    when 'projects'
      result += project_autocompletion(term)
    when 'users'
      result += user_autocompletion(term)
    end

    result.uniq.sort.slice(0..9)
  end

  ### Events ###

  def event_autocompletion(term)
    title = Event.ransack(title_cont: term).result(distinct: true).order(:title).map { |event| event.title }
    place = Event.ransack(place_cont: term).result(distinct: true).order(:place).map { |event| event.place }

    (title + place).uniq
  end

  def event_search(tags)
    events_tags = search_events_by_tag(tags)
    events_fields = []
    tags.each do |tag|
      events_fields += search_events_by_field(tag)
    end

    (events_tags + events_fields).uniq
  end

  def search_events_by_tag(tags)
    Event.tagged_with(tags)
  end

  def search_events_by_field(field, limit = nil)
    Event.ransack(title_cont: field, place_cont: field, m: 'or').result(distinct: true).order(:title).limit(limit)
  end

  ### Projects ###

  def project_autocompletion(term)
    Project.ransack(name_cont: term).result(distinct: true).order(:name).map { |project| project.name }
  end

  def project_search(tags)
    projects_tags = search_projects_by_tag(tags)
    projects_fields = []
    tags.each do |tag|
      projects_fields += search_projects_by_field(tag)
    end

    (projects_tags + projects_fields).uniq
  end

  def search_projects_by_tag(tags)
    Project.tagged_with(tags)
  end

  def search_projects_by_field(field, limit = nil)
    Project.ransack(name_cont: field).result(distinct: true).order(:name).limit(limit)
  end

  ### Users ###

  def user_autocompletion(term)
    name = User.ransack(name_cont: term).result(distinct: true).order(:name).map { |user| user.name }
    fname = User.ransack(fname_cont: term).result(distinct: true).order(:fname).map { |user| user.fname }
    organization_name = User.ransack(organization_name_cont: term).result(distinct: true).order(:organization_name).map { |user| user.organization_name }
    city = User.ransack(city_cont: term).result(distinct: true).order(:city).map { |user| user.city }
    country = User.ransack(country_cont: term).result(distinct: true).order(:country).map { |user| user.country }
    languages = Language.ransack(name_cont: term).result(distinct: true).order(:name).map { |language| language.name }
    topics = Topic.ransack(name_cont: term).result(distinct: true).order(:name).map { |topic| topic.name }

    (name + fname + organization_name + city + country + languages + topics).uniq
  end

  def user_search(tags)
    users_tags = search_users_by_tag(tags)
    users_fields = []
    tags.each do |tag|
      users_fields += search_users_by_field(tag)
    end

    (users_tags + users_fields).uniq
  end

  def search_users_by_tag(tags)
    User.tagged_with(tags)
  end

  def search_users_by_field(field, limit = nil)
    User.ransack(name_cont: field, fname_cont: field, city_cont: field, country_cont: field, language_name_cont: field, topics_name_cont: field, organization_name_cont: field, m: 'or').result(distinct: true).order(:name).limit(limit)
  end

end
