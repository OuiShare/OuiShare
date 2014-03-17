module Admin
  class EventsSectionsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_home_path }
    end

    def update
      update! { admin_home_path }
    end

    def destroy
      destroy! { admin_home_path }
    end

    protected
    def permitted_params
      params.permit(events_section: [:title, :text, :link_text])
    end

    def resource
      @events_section ||= EventsSection.find(params[:id])
    end

    def build_resource
      @events_section = Language.find(params[:language_id]).build_events_section(permitted_params[:events_section])
    end
  end
end
