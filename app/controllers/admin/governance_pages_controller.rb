module Admin
  class GovernancePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_governance_pages_path }
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
      @governance_page ||= Governance.find(params[:id])
    end

    def build_resource
      @governance_page = Language.find(params[:language_id]).build_governance_page(permitted_params[:governance_page])
    end
  end
end
