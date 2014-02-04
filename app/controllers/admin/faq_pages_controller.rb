module Admin
  class FaqPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_faq_pages_path }
    end

    def update
      update! { admin_faq_pages_path }
    end

    def destroy
      destroy! { admin_faq_pages_path }
    end

    protected
    def permitted_params
      params.permit(faq_page: [:text, :image])
    end

    def resource
      @faq_page ||= FaqPage.find(params[:id])
    end

    def build_resource
      @faq_page = Language.find(params[:language_id]).build_faq_page(permitted_params[:faq_page])
    end
  end
end
