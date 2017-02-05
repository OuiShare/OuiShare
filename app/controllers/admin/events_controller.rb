module Admin
  class EventsController < BaseController
    helper_method :clean_description
    inherit_resources
    belongs_to :language
    include AutoHtml
    skip_before_filter :verify_editor, only: [:show, :index]

    def autocomplete
      if params[:term].present?
        users = User.order(:name).where("name ILIKE ? OR fname ILIKE ?", "%#{params[:term]}%", "%#{params[:term]}%")

        respond_to do |format|
          format.json { render json: users.map{|u| { :label => u.full_name, :value => u.id } } }
        end
      end
    end

    def index
    end

    def create
      create! { admin_events_path }
    end

    def update
      if params[:add_users].present?
        add_users
      elsif params[:remove_users].present?
        remove_users
      else
        params[:event][:slug] = nil
        update! { admin_events_path }
      end
    end

    def destroy
      destroy! { admin_events_path }
    end

    def show
      @event = Event.find(params[:id])

      # if request.path != "/#{@current_language.slug}/#{event_path(@event)}"
      #   xxx
      #   redirect_to @event, status: :moved_permanently
      #   return
      # end

      # render 'admin/events/show'
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
                            :home_image,
                            :info,
                            :join_us_text,
                            :join_us_text_html,
                            :join_us_code_html,
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
                            :visible,
                            :display_on_menu,
                            :slug,
                            :address,
                            :latitude,
                            :longitude,
                            :user_ids => []])
    end

    private
    def add_users
      user_ids = params[:users][:event].split(",")
      users = User.find(user_ids)
      resource.users << users
      redirect_to admin_events_path, notice: 'Event was successfully updated.'
    end

    def remove_users
      user_ids = params[:users][:event].split(",")
      users = User.find(user_ids)
      resource.users.delete(users)
      redirect_to admin_events_path, notice: 'Event was successfully updated.'
    end
  end
end
