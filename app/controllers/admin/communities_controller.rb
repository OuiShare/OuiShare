module Admin
  class CommunitiesController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_communities_path }
    end

    def update
      update! { admin_communities_path }
    end

    def destroy
      destroy! { admin_communities_path }
    end

    def show
      @community = Community.find(params[:id])
      render 'admin/communities/show'
    end

    def sort
      resource.update_attribute :row_order_position, params[:community][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(community: [:name, :link, :text, :language_id, :region_id, :row_order_position, :user_ids => [], :event_ids => [], :project_ids => []])
    end

  end
end
