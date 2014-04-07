module Admin
  class TeamPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_team_pages_path }
    end

    def update
      update! { admin_team_pages_path }
    end

    def destroy
      destroy! { admin_team_pages_path }
    end

    protected
    def permitted_params
      params.permit(team_page: [:title, :text, :link_text])
    end

    def resource
      @team_page ||= TeamPage.find(params[:id])
    end

    def build_resource
      @team_page = Language.find(params[:language_id]).build_team_page(permitted_params[:team_page])
    end
  end
end
