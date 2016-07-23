class EventsController < ApplicationController

	helper_method :clean_description
	
  def index
    
    @events = Event.visible.next.paginate(:page => params[:page]).order('date_start')
    
  end

  def past_events

    @events = Event.visible.paginate(:page => params[:page]).order('date_start DESC')
    @past = true

    render "index"
  end
end
