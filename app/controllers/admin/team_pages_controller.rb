module Admin
  class TeamPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @team_page = DefaultAttributes.new(@team_page).set()
      if @team_page.save
        redirect_to admin_team_pages_path
      else
        redirect_to new_admin_language_team_page_path(params[:language_id])
      end
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
