module Admin
  class ActivitiesController < BaseController
    inherit_resources
    belongs_to :language

    before_filter :verify_admin

    def index
    end

    def create
      create! { admin_activities_path }
    end

    def update
      update! { admin_activities_path }
    end

    def destroy
      destroy! { admin_activities_path }
    end

    def show
      @activity = Activity.find(params[:id])
      render 'admin/activities/show'
    end

    def sort
      resource.update_attribute :row_order_position, params[:activity][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(activity: [:name, :image, :text, :row_order_position, :language_id])
    end

  end
end
