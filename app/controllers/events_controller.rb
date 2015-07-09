class EventsController < ApplicationController
  def index
    if params[:past]
      @events = @current_language.events.visible.paginate(:page => params[:page]).order('date_start')
      @past = true
    else
      @events = @current_language.events.visible.next.paginate(:page => params[:page]).order('date_start')
    end
  end
end
