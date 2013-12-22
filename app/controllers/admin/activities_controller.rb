module Admin
  class ActivitiesController < BaseController
    inherit_resources
    belongs_to :language

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

    protected
    def permitted_params
      params.permit(activity: [:name, :image, :text, :language_id])
    end

  end
end
