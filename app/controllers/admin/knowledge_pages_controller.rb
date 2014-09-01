module Admin
  class KnowledgePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_knowledge_pages_path }
    end

    def update
      update! { admin_knowledge_pages_path }
    end

    def destroy
      destroy! { admin_knowledge_pages_path }
    end

    protected
    def permitted_params
      params.permit(knowledge_page: [:main_text, :image, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4])
    end

    def resource
      @knowledge_page ||= KnowledgePage.find(params[:id])
    end

    def build_resource
      @knowledge_page = Language.find(params[:language_id]).build_knowledge_page(permitted_params[:knowledge_page])
    end
  end
end
