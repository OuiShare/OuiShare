module Admin
  class ResearchPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_research_pages_path }
    end

    def update
      update! { admin_research_pages_path }
    end

    def destroy
      destroy! { admin_research_pages_path }
    end

    protected
    def permitted_params
      params.permit(research_page: [:main_text, :image])
    end

    def resource
      @research_page ||= ResearchPage.find(params[:id])
    end

    def build_resource
      @research_page = Language.find(params[:language_id]).build_research_page(permitted_params[:research_page])
    end
  end
end
