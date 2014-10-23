module Admin
  class GovernancePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @governance_page = DefaultAttributes.new(@governance_page).set([:image])
      if @governance_page.save
        redirect_to admin_governance_pages_path
      else
        redirect_to new_admin_language_governace_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_governance_pages_path }
    end

    def destroy
      destroy! { admin_governance_pages_path }
    end

    protected
    def permitted_params
      params.permit(governance_page: [:text, :image])
    end

    def resource
      @governance_page ||= GovernancePage.find(params[:id])
    end

    def build_resource
      @governance_page = Language.find(params[:language_id]).build_governance_page(permitted_params[:governance_page])
    end
  end
end
