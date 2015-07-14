class EventsController < ApplicationController
  def index
    
    @events = Event.visible.next.paginate(:page => params[:page]).order('date_start')
    
  end

  def past_events

    @events = Event.visible.paginate(:page => params[:page]).order('date_start')
    @past = true

    render "index"
  end
end
