module Admin
  class AdvisorsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @advisors_page = DefaultAttributes.new(@advisors_page).set()
      if @advisors_page.save
        redirect_to admin_advisors_pages_path
      else
        redirect_to new_admin_advisors_page_path
      end
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
