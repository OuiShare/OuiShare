module Admin
  class AdvisorsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      create! { admin_advisors_pages_path }
    end

    def update
      update! { admin_advisors_pages_path }
    end

    def destroy
      destroy! { admin_advisors_pages_path }
    end

    protected
    def permitted_params
      params.permit(advisors_page: [:title, :text, :link_text])
    end

    def resource
      @advisors_page ||= AdvisorsPage.find(params[:id])
    end

    def build_resource
      @advisors_page = Language.find(params[:language_id]).build_advisors_page(permitted_params[:advisors_page])
    end
  end
end
