module Admin
  class TimelinesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_timelines_path }
    end

    def update
      update! { admin_timelines_path }
    end

    def destroy
      destroy! { admin_timelines_path }
    end

    protected
    def permitted_params
      params.permit(timeline: [:url, :text])
    end

    def resource
      @timeline ||= Timeline.find(params[:id])
    end

    def build_resource
      @timeline = Language.find(params[:language_id]).build_timeline(permitted_params[:timeline])
    end
  end
end
