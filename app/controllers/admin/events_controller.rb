module Admin
  class EventsController < BaseController
    inherit_resources
    belongs_to :language
    include AutoHtml

    def index
    end

    def create
      create! { admin_events_path }
    end

    def update
      update! { admin_events_path }
    end

    def destroy
      destroy! { admin_events_path }
    end

    def show
      @event = Event.find(params[:id])
      @event.info = auto_html(@event.info) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
      @event.text1 = auto_html(@event.text1) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
      @event.text2 = auto_html(@event.text2) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
      render 'admin/events/show'
    end

    protected
    def permitted_params
      params.permit(event: [:title,
                            :place,
                            :date_start,
                            :date_end,
                            :time,
                            :resume,
                            :image,
                            :info,
                            :join_us_text,
                            :service1_image,
                            :service1_link,
                            :service1_title,
                            :service2_image,
                            :service2_link,
                            :service2_title,
                            :service3_image,
                            :service3_link,
                            :service3_title,
                            :title1,
                            :text1,
                            :title2,
                            :text2,
                            :tag_list,
                            :visible])
    end
  end
end
