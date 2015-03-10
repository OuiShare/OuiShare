module Admin
  class MissionsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def new
      @mission = Mission.new(language_id: params[:language_id])
      if @mission.save
        render edit: @mission
      end
    end

    def create
      create! { admin_missions_path }
    end

    def update
      update! { admin_missions_path }
    end

    def destroy
      destroy! { admin_missions_path }
    end

    protected
    def permitted_params
      params.permit(mission: [:text, :image])
    end

    def resource
      @mission ||= Mission.find(params[:id])
    end

    def build_resource
      @mission = Language.find(params[:language_id]).build_mission(permitted_params[:mission])
    end
  end
end
