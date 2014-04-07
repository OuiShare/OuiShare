module Admin
  class FundedPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_funded_pages_path }
    end

    def update
      update! { admin_funded_pages_path }
    end

    def destroy
      destroy! { admin_funded_pages_path }
    end

    protected
    def permitted_params
      params.permit(funded_page: [:main_text, :image])
    end

    def resource
      @funded_page ||= FundedPage.find(params[:id])
    end

    def build_resource
      @funded_page = Language.find(params[:language_id]).build_funded_page(permitted_params[:funded_page])
    end
  end
end
