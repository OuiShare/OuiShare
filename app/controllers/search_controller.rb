class SearchController < ApplicationController
  before_action :init_search_types

  def search
    @result = {}

    if params[:search]
      @query_tags = parse_tags
      query_type = params[:search][:type]

      if query_type and @query_tags.size > 0
        case query_type
        when 'all'
          @result[:events] = search_events_by_tag(@query_tags)
          @result[:projects] = search_projects_by_tag(@query_tags)
          @result[:users] = search_users_by_tag(@query_tags)
        when 'events'
          @result[:events] = search_events_by_tag(@query_tags)
        when 'projects'
          @result[:projects] = search_projects_by_tag(@query_tags)
        when 'users'
          @result[:users] = search_users_by_tag(@query_tags)
        end
      end
    end
  end

  def autocomplete_tags
    term = "#{params[:term]}%"

    respond_to do |format|
      format.json { render :json => ActsAsTaggableOn::Tag.where('name like ?', term).order(:name).limit(10).map { |tag| tag.name } }
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

  def search_events_by_tag(tags)
    Event.tagged_with(tags)
  end

  # def search_events_by_title(events = nil, title)
    # return Event.ransack(title_eq: title).result
  # end

  def search_projects_by_tag(tags)
    Project.tagged_with(tags)
  end

  def search_users_by_tag(tags)
    User.tagged_with(tags)
  end
end
