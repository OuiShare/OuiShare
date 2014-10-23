module Admin
  class HotProjectsSectionsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @hot_projects_section = DefaultAttributes.new(@hot_projects_section).set()
      if @hot_projects_section.save
        redirect_to admin_home_path
      else
        redirect_to new_admin_language_hot_projects_section_path(params[:language_id])
      end
    end

    def update
      update! { admin_home_path }
    end

    def destroy
      destroy! { admin_home_path }
    end

    protected
    def permitted_params
      params.permit(hot_projects_section: [:title, :text, :link_text])
    end

    def resource
      @hot_projects_section ||= HotProjectsSection.find(params[:id])
    end

    def build_resource
      @hot_projects_section = Language.find(params[:language_id]).build_hot_projects_section(permitted_params[:hot_projects_section])
    end
  end
end
