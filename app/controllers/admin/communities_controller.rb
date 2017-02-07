module Admin
  class CommunitiesController < BaseController
    inherit_resources
    belongs_to :language

    def autocomplete
      if params[:term].present?
        events = Event.order(:title).where("title ILIKE ?", "%#{params[:term]}%")

        respond_to do |format|
          format.json { render json: events.map{|e| { :label => e.name_with_date_and_language, :value => e.id } } }
        end
      end
    end

    def index
    end

    def create
      create! { admin_communities_path }
    end

    def update
      add_events if params[:community_events_add].present?
      remove_events if params[:community_events_remove].present?

      update! { admin_communities_path }
    end

    def destroy
      destroy! { admin_communities_path }
    end

    # def show
    #   @community = Community.find(params[:id])
    #   render 'admin/communities/show'
    # end

    def sort
      resource.update_attribute :row_order_position, params[:community][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(community: [:name,
                                :link,
                                :text,
                                :embed_code_html,
                                :address,
                                :latitude,
                                :longitude,
                                :main_image,
                                :language_id,
                                :region_id,
                                :row_order_position,
                                :user_ids => [],
                                :project_ids => [],
                                :event_ids => []])
    end

    private
    def add_events
      event_ids = params[:community_events_add].split(",")
      events = Event.find(event_ids)
      resource.events << events
    end

    def remove_events
      event_ids = params[:community_events_remove].split(",")
      events = Event.find(event_ids)
      resource.events.delete(events)
    end
  end
end
